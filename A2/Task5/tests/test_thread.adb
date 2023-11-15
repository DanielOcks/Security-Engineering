--
--  Copyright (C) 2008, AdaCore
--
with AUnit.Reporter.Text;
with AUnit.Run;
with Thread_Suite; use Thread_Suite;

procedure Test_Thread is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Test_Thread;
