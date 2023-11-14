with Bank_Accounts.Tests;

package Bank_Accounts.Overdrawable.Tests is

   type Test is new Bank_Accounts.Tests.Test with null record;

   procedure Set_Up (T : in out Test);

   procedure Test_Depos_InvAmount_Exc;
   procedure Test_WDraw_InvAmount_Exc;
   procedure Test_WDraw_Overspent_Exc;

   procedure Test_Depos (T : in out Test);
   procedure Test_WDraw (T : in out Test);
   procedure Test_Transf (T : in out Test);

end Bank_Accounts.Overdrawable.Tests;
