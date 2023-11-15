with Ada.Text_IO; use Ada.Text_IO;
with Thread; use Thread;
with AUnit.Assertions;
--with Ada.Assertions;

procedure T5_Threads is

   procedure Test_Initialize_Exc is
      S : State;
   begin
      Initialize(S);
      Do_Action(S, Start);
      Initialize(S);
   end Test_Initialize_Exc;

   procedure Test_Initialization is
      S : State;
   begin
      Initialize(S);
      AUnit.Assertions.Assert (S = Ready, "Thread not initialized to Ready state.");
      AUnit.Assertions.Assert_Exception(Test_Initialize_Exc'Access, "Initialize should throw an assertion error");

   end Test_Initialization;

   procedure Test_Start_Stop_Transition is
      S : State;
   begin
      Initialize(S);
      Do_Action(S, Start);
      AUnit.Assertions.Assert (S = Running, "Incorrect state after Start action.");

      Do_Action(S, Stop);
      AUnit.Assertions.Assert (S = Stopped, "Incorrect state after Stop action.");
   end Test_Start_Stop_Transition;

   procedure Test_Wait_Notify_Transition is
      S : State;
   begin
      Initialize(S);
      Do_Action(S, Start);
      Do_Action(S, Wait);
      AUnit.Assertions.Assert (S = Waiting, "Incorrect state after Wait action.");

      Do_Action(S, Notify);
      AUnit.Assertions.Assert (S = Running, "Incorrect state after Notify action.");
   end Test_Wait_Notify_Transition;

   procedure Test_Sleep_Resume_Transition is
      S : State;
   begin
      Initialize(S);
      Do_Action(S, Start);
      Do_Action(S, Sleep);
      AUnit.Assertions.Assert (S =Sleeping, "Incorrect state after Sleep action.");

      Do_Action(S, Resume);
      AUnit.Assertions.Assert (S = Running, "Incorrect state after Resume action.");
   end Test_Sleep_Resume_Transition;

   procedure Test_Undefined_Transition is
      S : State;
   begin
      Initialize(S);
      Do_Action(S, Sleep);
      AUnit.Assertions.Assert (S = None, "Incorrect state after invalid Sleep action.");

   end Test_Undefined_Transition;

begin
   Test_Initialize_Exc;
   Test_Initialization;
   Test_Start_Stop_Transition;
   Test_Wait_Notify_Transition;
   Test_Sleep_Resume_Transition;
   Test_Undefined_Transition;
   Put_Line("everything ok");
end T5_Threads;
