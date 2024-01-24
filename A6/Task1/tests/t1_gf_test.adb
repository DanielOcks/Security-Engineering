--
--  Copyright (C) 2008, AdaCore
--
with AUnit.Reporter.Text;
with AUnit.Run;
with GF_Suite; use GF_Suite;

procedure T1_GF_Test is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
   
end T1_GF_Test;
