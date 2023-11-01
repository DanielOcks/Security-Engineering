with Ada.Text_IO; use Ada.Text_IO;
with Bank_Accounts;

procedure T3_Bank is
   A: Bank_Accounts.Account_Type;
   B: Bank_Accounts.Account_Type;
begin
   A.Balance := (54);
   Put_Line("Balance in account A is:");
   Put_Line(A.Balance'Image);
   Put_Line("Balance in account B is:");
   Put_Line(B.Balance'Image);
   Put_Line("Depositting 20 to account B ...");
   Bank_Accounts.Deposit(B, 20);
   Put_Line("Withdrawing 4 from account A ...");
   Bank_Accounts.Withdraw(A, 4);
   Put_Line("Transfering 10 from A to B ...");
   Bank_Accounts.Transfer(A, B, 10);
   -- Bank_Accounts.Withdraw(A, 0);
   -- Bank_Accounts.Withdraw(B, -3);
   -- Bank_Accounts.Transfer(A, B, 0);
   Put_Line("Balance in account A is:");
   Put_Line(A.Balance'Image);
   Put_Line("Balance in account B is:");
   Put_Line(B.Balance'Image);

end T3_Bank;
