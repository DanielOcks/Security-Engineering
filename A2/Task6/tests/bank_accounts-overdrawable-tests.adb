with AUnit.Assertions;   use AUnit.Assertions;

with Bank_Accounts;

package body Bank_Accounts.Overdrawable.Tests is

   package BA renames Bank_Accounts;

   Local_Bank_Account : aliased Account_Overdrawable_Type;
   Local_Transfer_Account : aliased Account_Overdrawable_Type;
   procedure Set_Up (T : in out Test) is
   begin
      T.Bank_Account := Local_Bank_Account'Access;
      T.Transfer_Account := Local_Transfer_Account'Access;
   end Set_Up;

   procedure Test_Depos_InvAmount_Exc is
   Temp : BA.Overdrawable.Account_Overdrawable_Type;
   begin
      BA.Overdrawable.Deposit (Temp, -1);
   end Test_Depos_InvAmount_Exc;

   procedure Test_WDraw_InvAmount_Exc is
   Temp : BA.Overdrawable.Account_Overdrawable_Type;
   begin
      BA.Overdrawable.Withdraw (Temp, -1);
   end Test_WDraw_InvAmount_Exc;

   procedure Test_WDraw_Overspent_Exc is
   Temp : BA.Overdrawable.Account_Overdrawable_Type;
   begin
      BA.Overdrawable.Withdraw (Temp, 9999999);
   end Test_WDraw_Overspent_Exc;

   procedure Test_Depos (T : in out Test) is
   begin
      BA.Deposit (T.Bank_Account.all, 50000);
      Assert (BA.Get_Balance (T.Bank_Account.all) = 50000,
              "Wrong Balance after Deposit | Should be: 50000" & " is: " & BA.Get_Balance (T.Bank_Account.all)'Image);
      Assert_Exception (Test_Depos_InvAmount_Exc'Access,
                        "Deposit should throw an Invalid_Amount_Exception on invalid Amounts");
   end Test_Depos;

   procedure Test_WDraw (T : in out Test) is 
   begin
      BA.Withdraw (T.Bank_Account.all, 50000);
      BA.Withdraw (T.Bank_Account.all, 5000);
      Assert (BA.Get_Balance (T.Bank_Account.all) = -5000,
               "Wrong Balance after Withdraw with Overdrawable | Should be: -5000" & " is: " & BA.Get_Balance (T.Bank_Account.all)'Image);
      Assert_Exception (Test_WDraw_InvAmount_Exc'Access,
                        "Withdraw should throw an Invalid_Amount_Exception on invalid Amounts");
      Assert_Exception (Test_WDraw_Overspent_Exc'Access,
                        "Withdraw should throw an Overspent_Exception on Amount > Balance");
   end Test_WDraw;

   procedure Test_Transf (T : in out Test) is
   begin
      BA.Transfer (T.Bank_Account.all, T.Transfer_Account.all, 4000);
      Assert (BA.Get_Balance (T.Bank_Account.all) = -9000,
               "Wrong Balance after Transfer with Overdrawable | Should be: -9000" & " is: " & BA.Get_Balance (T.Bank_Account.all)'Image);
      Assert (BA.Get_Balance (T.Transfer_Account.all) = 4000,
               "Wrong Balance after receiveng money from Transfer | Should be: 4000" & " is: " & BA.Get_Balance (T.Transfer_Account.all)'Image);
   end Test_Transf;

end Bank_Accounts.Overdrawable.Tests;
