with Murmur_Hash2.Test; use Murmur_Hash2.Test;
with AUnit.Test_Caller;

package body Murmur_Suite is

   package Caller is new AUnit.Test_Caller (Murmur_Hash2.Test.Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test
        (Caller.Create ("Test hashing", Test_Hashing'Access));
      return Ret;
   end Suite;

end Murmur_Suite;
