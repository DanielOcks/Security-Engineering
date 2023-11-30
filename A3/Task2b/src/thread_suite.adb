
with Thread.Test;         use Thread.Test;
with AUnit.Test_Caller;

package body Thread_Suite is

   package Caller is new AUnit.Test_Caller (Thread.Test.Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test
        (Caller.Create ("Test Initialization Exc", Test_Initialize_Exc'Access));
      Ret.Add_Test
        (Caller.Create ("Test Invalid State Exc", Test_Invalid_State_Exc'Access));
      Ret.Add_Test
        (Caller.Create ("Test Initialization", Test_Initialization'Access));
      Ret.Add_Test
        (Caller.Create ("Test Start Transition", Test_Start_Transition'Access));

      Ret.Add_Test
        (Caller.Create ("Test Stop Trans On Ready", Test_Stop_Trans_On_Ready'Access));
      Ret.Add_Test
        (Caller.Create ("Test Invalid Trans On Ready", Test_Invalid_Trans_On_Ready'Access));
      Ret.Add_Test
        (Caller.Create ("Test Invalid Trans On Running", Test_Invalid_Trans_On_Running'Access));
      Ret.Add_Test
        (Caller.Create ("Test Invalid Trans On Waiting", Test_Invalid_Trans_On_Waiting'Access));
      Ret.Add_Test
        (Caller.Create ("Test Invalid Trans On Sleeping", Test_Invalid_Trans_On_Sleeping'Access));

      Ret.Add_Test
        (Caller.Create ("Test Wait Notify Transition", Test_Wait_Notify_Transition'Access));
      Ret.Add_Test
        (Caller.Create ("Test Sleep Resume Transition", Test_Sleep_Resume_Transition'Access));
      Ret.Add_Test
        (Caller.Create ("Test Stop Transition", Test_Stop_Transition'Access));
      Ret.Add_Test
        (Caller.Create ("Test Undefined Transition", Test_Undefined_Transition'Access));
      return Ret;
   end Suite;

end Thread_Suite;
