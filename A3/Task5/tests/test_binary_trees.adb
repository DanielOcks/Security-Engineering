with AUnit.Reporter.Text;
with AUnit.Run;
with Binary_Trees_Suite; use Binary_Trees_Suite;

procedure Test_Binary_Trees is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Test_Binary_Trees;
