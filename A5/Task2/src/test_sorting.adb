--
--  Copyright (C) 2008, AdaCore
--
with AUnit.Reporter.Text;
with AUnit.Run;
with Sorting_Suite; use Sorting_Suite;

procedure test_sorting is
   procedure Runner is new AUnit.Run.Test_Runner(Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end test_sorting;
