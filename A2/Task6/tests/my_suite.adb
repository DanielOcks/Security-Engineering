with Bank_Accounts.Tests.Suite;
with Bank_Accounts.Fees.Tests.Suite;
with Bank_Accounts.Overdrawable.Tests.Suite;

package body My_Suite is

   Result : aliased AUnit.Test_Suites.Test_Suite;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin
      Result.Add_Test (Bank_Accounts.Tests.Suite.Suite);
      Result.Add_Test (Bank_Accounts.Fees.Tests.Suite.Suite);
      Result.Add_Test (Bank_Accounts.Overdrawable.Tests.Suite.Suite);
      return Result'Access;
   end Suite;

end My_Suite;
