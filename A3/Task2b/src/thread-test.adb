
with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;
package body Thread.Test is

   procedure Test_Initialize_Exc(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Running;
   begin
      Initialize(S);
      Assert (False, "Initialize should raise an exception");
   exception
      when others =>
         null;
   end Test_Initialize_Exc;

   procedure Test_Invalid_State_Exc(T : in out Test) is
      pragma Unreferenced (T);
      S : State := None;
   begin
      Do_Action(S, Start);
      Assert (False, "Performing actions on an invalid state (None) should raise an exception");
   exception
      when others =>
         null;
   end Test_Invalid_State_Exc;

   procedure Test_Initialization (T : in out Test) is
      pragma Unreferenced (T);
      S : State := None;
   begin
      Initialize(S);
      Assert(S = Ready, "Thread not initialized to Ready state.");

      -- Assert_Exception(Test_Initialize_Exc'Access, "Initialize should raise an exception");
      --Assert_Exception(Test_Invalid_State_Exc'Access, "Performing actions on an invalid state (None) should raise an exception");
   end Test_Initialization;

   procedure Test_Start_Transition (T : in out Test) is
      pragma Unreferenced (T);
      S : State := Ready;
   begin
      Do_Action(S, Start);
      Assert (S = Running, "Incorrect state after Start action.");
   end Test_Start_Transition;

   procedure Test_Stop_Trans_On_Ready(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Ready;
   begin
      Do_Action(S, Stop);
      Assert (S = Stopped, "Incorrect state after Stop action.");
   end Test_Stop_Trans_On_Ready;

   procedure Test_Invalid_Trans_On_Ready(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Ready;
   begin
      Do_Action(S, Sleep);
      Assert (S = None, "Incorrect state after Sleep action.");
   end Test_Invalid_Trans_On_Ready;

   procedure Test_Invalid_Trans_On_Running(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Running;
   begin
      Do_Action(S, Notify);
      Assert (S = None, "Incorrect state after Notify action.");
   end Test_Invalid_Trans_On_Running;

   procedure Test_Invalid_Trans_On_Waiting(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Waiting;
   begin
      Do_Action(S, Sleep);
      Assert (S = None, "Incorrect state after Sleep action.");
   end Test_Invalid_Trans_On_Waiting;

   procedure Test_Invalid_Trans_On_Sleeping(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Sleeping;
   begin
      Do_Action(S, Notify);
      Assert (S = None, "Incorrect state after Notify action.");
   end Test_Invalid_Trans_On_Sleeping;

   procedure Test_Wait_Notify_Transition (T : in out Test) is
      pragma Unreferenced (T);
      S : State := Running;
   begin
      Do_Action(S, Wait);
      Assert (S = Waiting, "Incorrect state after Wait action.");

      Do_Action(S, Notify);
      Assert (S = Running, "Incorrect state after Notify action.");
   end Test_Wait_Notify_Transition;

   procedure Test_Sleep_Resume_Transition (T : in out Test) is
      pragma Unreferenced (T);
      S : State := Running;
   begin
      Do_Action(S, Sleep);
      Assert (S = Sleeping, "Incorrect state after Sleep action.");

      Do_Action(S, Resume);
      Assert (S = Running, "Incorrect state after Resume action.");
   end Test_Sleep_Resume_Transition;

   procedure Test_Stop_Transition(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Running;
   begin
      Do_Action(S, Stop);
      Assert (S = Stopped, "Incorrect state after Stop action.");
   end Test_Stop_Transition;

   procedure Test_Undefined_Transition(T : in out Test) is
      pragma Unreferenced (T);
      S : State := Stopped;
   begin
      Do_Action(S, Sleep);
      Assert (S = None, "Incorrect state after Sleep action.");
   end Test_Undefined_Transition;

end Thread.Test;
