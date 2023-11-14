package body Bank_Accounts.Overdrawable is

    procedure Withdraw(Account: in out Account_Overdrawable_Type; Amount: Cents_Type) is
    begin
        if Amount < 1 then
            raise Invalid_Amount_Exception;
        end if;
        if Amount > Account.Balance + Account.Limit then
            raise Overspent_Exception;
        end if; 
        Account.Balance := Account.Balance - Amount;
    end Withdraw;
   
   procedure Transfer(From: in out Account_Overdrawable_Type; 
                      To: in out Account_Overdrawable_Type; 
                      Amount: in Cents_Type) is
   begin
        Withdraw(From, Amount);
        Deposit(To, Amount);
   end Transfer;

end Bank_Accounts.Overdrawable;
