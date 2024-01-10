with AUnit.Assertions; use AUnit.Assertions;
with Parallel_Algorithms;

package body PA_Tests is

   procedure Test_Array_1 (T : in out Test) is
      pragma Unreferenced (T);
      package Integer_Sum is new Parallel_Algorithms(Item_Type => Integer, "+" => Standard."+");

      A : aliased Integer_Sum.Array_Type := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      Result : Integer := 0;

   begin
      Integer_Sum.Parallel_Sum(A'Access, Result);
      Assert (Result = 55, "Incorrect sum, it should be 55 but got" & Integer'Image(Result));
   end Test_Array_1;

   procedure Test_Array_2 (T : in out Test) is
      pragma Unreferenced (T);
      package Integer_Sum is new Parallel_Algorithms(Item_Type => Integer, "+" => Standard."+");

      A : aliased Integer_Sum.Array_Type := (2, 3);
      Result : Integer := 0;

   begin
      Integer_Sum.Parallel_Sum(A'Access, Result);
      Assert (Result = 5, "Incorrect sum, it should be 5 but got" & Integer'Image(Result));
   end Test_Array_2;

   procedure Test_Array_3 (T : in out Test) is
      pragma Unreferenced (T);
      package Integer_Sum is new Parallel_Algorithms(Item_Type => Integer, "+" => Standard."+");

      A : aliased Integer_Sum.Array_Type := (2, 3, 2);
      Result : Integer := 0;

   begin
      Integer_Sum.Parallel_Sum(A'Access, Result);
      Assert (Result = 7, "Incorrect sum, it should be 7 but got" & Integer'Image(Result));
   end Test_Array_3;

   procedure Test_Array_4 (T : in out Test) is
      pragma Unreferenced (T);
      package Integer_Sum is new Parallel_Algorithms(Item_Type => Integer, "+" => Standard."+");

      A : aliased Integer_Sum.Array_Type := (10, 20, 33, 55, 57, 87, 9, 12, 23, 4, 54, 16, 27, 6, 6);
      Result : Integer := 0;

   begin
      Integer_Sum.Parallel_Sum(A'Access, Result);
      Assert (Result = 419, "Incorrect sum, it should be 419 but got" & Integer'Image(Result));
   end Test_Array_4;

end PA_Tests;
