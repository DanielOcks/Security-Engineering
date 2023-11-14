with AUnit.Reporter.Text;
with AUnit.Run;
with My_Suite; use My_Suite;

procedure Test_Bank_Accounts is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Test_Bank_Accounts;
