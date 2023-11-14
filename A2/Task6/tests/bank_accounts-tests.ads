with AUnit.Test_Fixtures;

package Bank_Accounts.Tests is

   type Test is new AUnit.Test_Fixtures.Test_Fixture
   with record
      Bank_Account : Account_Access;
      Transfer_Account : Account_Access;
   end record;

   procedure Set_Up (T : in out Test);

   procedure Test_Depos_InvAmount_Exc;
   procedure Test_WDraw_InvAmount_Exc;
   procedure Test_WDraw_Overspent_Exc;

   procedure Test_Depos (T : in out Test);
   procedure Test_WDraw (T : in out Test);
   procedure Test_Transf (T : in out Test);

end Bank_Accounts.Tests;
