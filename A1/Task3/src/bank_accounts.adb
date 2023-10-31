package body Bank_Accounts is
   function Get_Balance(Account: Account_Type) return Cents_Type is 
   begin
      return Account.Balance;
   end Get_Balance;
   
   procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is 
   begin
      if Amount <= 0 then
         raise Constraint_Error with "The amount can not be negative or eqaul to 0!";
      else 
         Account.Balance := Account.Balance + Amount;
      end if;
   end Deposit;
   
   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      if Amount <= 0 then
         raise Constraint_Error with "The amount can not be negative or eqaul to 0!";
      else 
         Account.Balance := Account.Balance - Amount;
      end if;
   end Withdraw;
   
   procedure Transfer(From: in out Account_Type; 
                       To: in out Account_Type; 
                      Amount: in Cents_Type) is
   begin
      if Amount <= 0 then
         raise Constraint_Error with "The amount can not be negative or eqaul to 0!";
      end if;
  
      if Amount <= From.Balance then
         Withdraw(From, Amount);
         Deposit(To, Amount);
      else
         raise Constraint_Error with "The transformed amount is larger than the account's balance !!";
      end if;
   end Transfer;
end Bank_Accounts;
