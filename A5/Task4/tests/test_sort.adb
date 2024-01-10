with AUnit.Reporter.Text;
with AUnit.Run;
with Sort_Suite; use Sort_Suite;

procedure Test_Sort is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Test_Sort;
