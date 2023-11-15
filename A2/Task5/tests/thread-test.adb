
with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;
package body Thread.Test is

   procedure Test_Initialize_Exc is
      S : State := Running;
   begin
      Initialize(S);
   end Test_Initialize_Exc;

   procedure Test_Invalid_State_Exc is
      S : State := None;
   begin
      Do_Action(S, Start);
   end Test_Invalid_State_Exc;

   procedure Test_Initialization (T : in out Test) is
   begin
      Initialize(T.S);
      Assert(T.S = Running, "Thread not initialized to Ready state.");

      Assert_Exception(Test_Initialize_Exc'Access, "Initialize should raise an exception");
      Assert_Exception(Test_Invalid_State_Exc'Access, "Performing actions on an invalid state (None) should raise an exception");
   exception
         when others => Ada.Text_IO.Put_Line("Test initialization failed :)");
   end Test_Initialization;

   procedure Test_Start_Transition (T : in out Test) is
   begin
      Do_Action(T.S, Start);
      Assert (T.S = Running, "Incorrect state after Start action.");
   end Test_Start_Transition;

   procedure Test_Wait_Notify_Transition (T : in out Test) is
   begin
      Do_Action(T.S, Wait);
      Assert (T.S = Waiting, "Incorrect state after Wait action.");

      Do_Action(T.S, Notify);
      Assert (T.S = Running, "Incorrect state after Notify action.");
   end Test_Wait_Notify_Transition;

   procedure Test_Sleep_Resume_Transition (T : in out Test) is
   begin
      Do_Action(T.S, Sleep);
      Assert (T.S = Sleeping, "Incorrect state after Sleep action.");

      Do_Action(T.S, Resume);
      Assert (T.S = Running, "Incorrect state after Resume action.");
   end Test_Sleep_Resume_Transition;

   procedure Test_Stop_Transition(T : in out Test) is
   begin
      Do_Action(T.S, Stop);
      Assert (T.S = Stopped, "Incorrect state after Stop action.");
   end Test_Stop_Transition;

   procedure Test_Undefined_Transition(T : in out Test) is
   begin
      Do_Action(T.S, Sleep);
      Assert (T.S = None, "Incorrect state after Sleep action.");
   end Test_Undefined_Transition;

end Thread.Test;
