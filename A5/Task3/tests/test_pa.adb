--
--  Copyright (C) 2008, AdaCore
--
with AUnit.Reporter.Text;
with AUnit.Run;
with PA_Suite; use PA_Suite;

procedure Test_PA is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Test_PA;
