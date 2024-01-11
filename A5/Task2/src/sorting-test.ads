with AUnit;
with AUnit.Test_Fixtures;

package Sorting.Test is

   type Test is new AUnit.Test_Fixtures.Test_Fixture with record
      A1 : Sorting.Natural_Array (1 .. 8) := (0, 5, 2, 4, 1, 3, 8, 7);
      A2 : Sorting.Natural_Array (1 .. 6) := (1, 1, 1, 1, 2, 3);
      A3 : Sorting.Natural_Array (1 .. 7) := (8, 7, 6, 5, 4, 3, 2);
      A4 : Sorting.Natural_Array (1..0);
      A5 : Sorting.Natural_Array (1..16) := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
   end record;

   procedure Test_Sorting_1(T : in out Test);
   procedure Test_Sorting_2(T : in out Test);
   procedure Test_Sorting_3(T : in out Test);
   procedure Test_Sorting_4(T : in out Test);
   procedure Test_Sorting_5(T : in out Test);

end Sorting.Test;
