package Bank_Accounts.Overdrawable is

    type Account_Overdrawable_Type is new Account_Type with private;

    Default_Limit: constant Cents_Type := 1000_00;

    procedure Withdraw(Account: in out Account_Overdrawable_Type; Amount: Cents_Type);

    procedure Transfer(From: in out Account_Overdrawable_Type;
                       To: in out Account_Overdrawable_Type;
                       Amount: in Cents_Type);

private
    type Account_Overdrawable_Type is new Account_Type with record
        Limit: Cents_Type := Default_Limit;
    end record;
end Bank_Accounts.Overdrawable;