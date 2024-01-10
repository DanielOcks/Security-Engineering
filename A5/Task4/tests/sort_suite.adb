with AUnit.Test_Caller;

with Parallel_Sort_Test; use Parallel_Sort_Test;

package body Sort_Suite is

   package Caller is new AUnit.Test_Caller (Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test
        (Caller.Create ("Test Sorting", Test_Sorting'Access));
      return Ret;
   end Suite;

end Sort_Suite;
