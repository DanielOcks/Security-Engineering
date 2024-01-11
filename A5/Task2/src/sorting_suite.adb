with Sorting.Test; use Sorting.Test;
with AUnit.Test_Caller;

package body Sorting_Suite is

   package Caller is new AUnit.Test_Caller (Sorting.Test.Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test
        (Caller.Create ("Test Sorting 1", Test_Sorting_1'Access));
      Ret.Add_Test
        (Caller.Create ("Test Sorting 2", Test_Sorting_2'Access));
      Ret.Add_Test
        (Caller.Create ("Test Sorting 3", Test_Sorting_3'Access));
      Ret.Add_Test
        (Caller.Create ("Test Sorting 4", Test_Sorting_4'Access));
       Ret.Add_Test
        (Caller.Create ("Test Sorting 5", Test_Sorting_5'Access));
      return Ret;
   end Suite;

end Sorting_Suite;
