with AUnit;
with AUnit.Test_Fixtures;

with Binary_Trees;

package Binary_Trees_Tests is

   procedure Put_Item (x : Natural);

   package BT is new Binary_Trees(Item_Type => Natural, "<" => "<", "=" => "=", Put_Item => Put_Item);

   type Test is new AUnit.Test_Fixtures.Test_Fixture
   with record
      Tree : BT.Binary_Tree_Access;
   end record;

   procedure Set_Up (T : in out Test);

   procedure Test_Add_Exc;
   procedure Test_Rem_Exc;

   procedure Test_Create (T : in out Test);
   procedure Test_Add (T : in out Test);
   procedure Test_Rem (T : in out Test);
   procedure Test_RemAll (T : in out Test);

end Binary_Trees_Tests;
