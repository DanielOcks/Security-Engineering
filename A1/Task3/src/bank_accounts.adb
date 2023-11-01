package body Bank_Accounts is
   function Get_Balance(Account: Account_Type) return Cents_Type is 
   begin
      return Account.Balance;
   end Get_Balance;
   
   procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is 
   begin
      Account.Balance := Account.Balance + Amount;
   end Deposit;
   
   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance - Amount;
   end Withdraw;
   
   procedure Transfer(From: in out Account_Type; 
                       To: in out Account_Type; 
                      Amount: in Cents_Type) is
   begin
      if Amount <= From.Balance then
         Withdraw(From, Amount);
         Deposit(To, Amount);
      else
         raise Constraint_Error with "The transformed amount is larger than the account's balance !!";
      end if;
   end Transfer;
end Bank_Accounts;
