package Bank_Accounts.Fees is

    type Account_Fees_Type is new Account_Type with private;

    Default_Fee: constant Cents_Type := 10;

    procedure Withdraw(Account: in out Account_Fees_Type; Amount: Cents_Type);

    procedure Transfer(From: in out Account_Fees_Type;
                       To: in out Account_Fees_Type;
                       Amount: in Cents_Type);

private
    type Account_Fees_Type is new Account_Type with record
        Fee: Cents_Type := Default_Fee;
    end record;
end Bank_Accounts.Fees;