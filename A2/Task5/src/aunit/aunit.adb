------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                                A U N I T                                 --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                                                                          --
--                       Copyright (C) 2008-2018, AdaCore                   --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT is maintained by AdaCore (http://www.adacore.com)                   --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with System.Storage_Elements;  use System.Storage_Elements;
with AUnit.Memory;             use AUnit.Memory;
with System;

package body AUnit is

   --  The allocation strategy below is based on a low-level trick that mimics
   --  what GNAT would generate for a regular allocator. Therefore it needs to
   --  be protected from changes of Default_Scalar_Storage_Order setting.

   pragma Warnings (Off, "scalar storage order");

   type Bounds is record
      First : Natural;
      Last  : Natural;
   end record
   with Bit_Order => System.Default_Bit_Order,
        Scalar_Storage_Order => System.Default_Bit_Order;

   type Bounds_Access is access all Bounds;

   type Fat_Pointer is record
      Address       : System.Address;
      Bound_Address : Bounds_Access;
   end record
   with Bit_Order => System.Default_Bit_Order,
        Scalar_Storage_Order => System.Default_Bit_Order;

   pragma Warnings (On, "scalar storage order");

   -------------------
   -- Message_Alloc --
   -------------------

   function Message_Alloc (Length : Natural) return Message_String is
      function To_Message is new Ada.Unchecked_Conversion
        (Fat_Pointer, Message_String);
      function To_Bounds_Access is new Ada.Unchecked_Conversion
        (System.Address, Bounds_Access);
      function To_Address is new Ada.Unchecked_Conversion
        (Bounds_Access, System.Address);
      Ret : Fat_Pointer;
   begin
      Ret.Bound_Address := To_Bounds_Access
        (AUnit.Memory.AUnit_Alloc
           (size_t (Length + (Bounds'Object_Size / 8))));
      Ret.Bound_Address.First := 1;
      Ret.Bound_Address.Last := Length;
      Ret.Address := To_Address (Ret.Bound_Address) + (Bounds'Size / 8);
      return To_Message (Ret);
   end Message_Alloc;

   ------------------
   -- Message_Free --
   ------------------

   procedure Message_Free (Msg : in out Message_String) is
   begin
      if Msg /= null then
         AUnit.Memory.AUnit_Free (Msg.all'Address);
         Msg := null;
      end if;
   end Message_Free;

   ------------
   -- Format --
   ------------

   function Format (S : String) return Message_String is
      Ptr : constant Message_String := Message_Alloc (S'Length);
   begin
      for J in S'Range loop
         Ptr (J - S'First + 1) := S (J);
      end loop;

      return Ptr;
   end Format;

end AUnit;