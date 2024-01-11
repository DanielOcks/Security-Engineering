with AUnit.Assertions; use AUnit.Assertions;

package body Sorting.Test is

   procedure Test_Sorting_1(T : in out Test) is
   begin
      Sorting.Selection_Sort(T.A1);
      Assert (T.A1 = (0, 1, 2, 3, 4, 5, 7, 8), "Correct sorting");
   exception
      when others =>
         null;
   end Test_Sorting_1;

   procedure Test_Sorting_2(T : in out Test) is
   begin
      Sorting.Selection_Sort(T.A2);
      Assert (T.A2 = (1, 1, 1, 1, 2, 3), "Correct sorting");
   exception
      when others =>
         null;
   end Test_Sorting_2;

   procedure Test_Sorting_3(T : in out Test) is
   begin
      Sorting.Selection_Sort(T.A3);
      Assert (T.A3 = (2, 3, 4, 5, 6, 7, 8), "Correct sorting");
   exception
      when others =>
         null;
   end Test_Sorting_3;

   procedure Test_Sorting_4(T : in out Test) is
   begin
      Sorting.Selection_Sort(T.A4);
      Assert (T.A4'Length = 0, "No sorting needed, because the Array is empty");
   exception
      when others =>
         null;
   end Test_Sorting_4;

   procedure Test_Sorting_5(T : in out Test) is
   begin
      Sorting.Selection_Sort(T.A5);
      Assert (T.A5 = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16), "Correct sorting");
   exception
      when others =>
         null;
   end Test_Sorting_5;

end Sorting.Test;
