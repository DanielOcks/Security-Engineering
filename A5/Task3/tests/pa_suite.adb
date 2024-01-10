with AUnit.Test_Caller;
with PA_Tests; use PA_Tests;

package body PA_Suite is
   package Caller is new AUnit.Test_Caller (PA_Tests.Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test
        (Caller.Create ("Test array with 10 elements", Test_Array_1'Access));
      Ret.Add_Test
        (Caller.Create ("Test array with 2 elements", Test_Array_2'Access));
      Ret.Add_Test
        (Caller.Create ("Test array with 3 elements", Test_Array_3'Access));
      Ret.Add_Test
        (Caller.Create ("Test array with 15 elements", Test_Array_4'Access));
      return Ret;
   end Suite;

end PA_Suite;
