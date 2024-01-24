with AUnit.Test_Caller;
with GF_Tests; use GF_Tests;

package body GF_Suite is
   package Caller is new AUnit.Test_Caller (GF_Tests.Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test
        (Caller.Create ("Test array with 10 elements", Test_Array_1'Access));
   end Suite;
   
end GF_Suite;
