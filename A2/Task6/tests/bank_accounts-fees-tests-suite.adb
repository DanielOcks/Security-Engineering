with AUnit.Test_Caller;

package body Bank_Accounts.Fees.Tests.Suite is

   package Runner is new AUnit.Test_Caller
     (Bank_Accounts.Fees.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Test_Deposit : aliased Runner.Test_Case;
   Test_Withdraw : aliased Runner.Test_Case;
   Test_Transfer : aliased Runner.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin
      Runner.Create (Test_Deposit,
                     "Bank Account with Fees : Test Deposit",
                     Test_Depos'Access);
      Runner.Create (Test_Withdraw,
                     "Bank Account with Fees : Test Withdraw",
                     Test_WDraw'Access);
      Runner.Create (Test_Transfer,
                     "Bank Account with Fees : Test Transfer",
                     Test_Transf'Access);
      Result.Add_Test (Test_Deposit'Access);
      Result.Add_Test (Test_Withdraw'Access);
      Result.Add_Test (Test_Transfer'Access);

      return Result'Access;
   end Suite;

end Bank_Accounts.Fees.Tests.Suite;
