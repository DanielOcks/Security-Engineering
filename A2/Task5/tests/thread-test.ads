
with AUnit;
with AUnit.Test_Fixtures;

package Thread.Test is

   type Test is new AUnit.Test_Fixtures.Test_Fixture with record
      S : State := None;
   end record;

   procedure Test_Initialize_Exc;
   procedure Test_Invalid_State_Exc;

   procedure Test_Initialization (T : in out Test);
   procedure Test_Start_Transition(T : in out Test);
   procedure Test_Wait_Notify_Transition(T : in out Test);
   procedure Test_Sleep_Resume_Transition(T : in out Test);
   procedure Test_Stop_Transition(T : in out Test);
   procedure Test_Undefined_Transition(T : in out Test);

end Thread.Test;
