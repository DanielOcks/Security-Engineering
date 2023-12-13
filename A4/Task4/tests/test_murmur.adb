with AUnit.Reporter.Text;
with AUnit.Run;
with Murmur_Suite; use Murmur_Suite;

procedure Test_Murmur is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Test_Murmur;
