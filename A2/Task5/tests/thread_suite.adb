--
--  Copyright (C) 2008, AdaCore
--
with Thread.Test;         use Thread.Test;
with AUnit.Test_Caller;

package body Thread_Suite is

   package Caller is new AUnit.Test_Caller (Thread.Test.Test);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test
        (Caller.Create ("Test Initialization", Test_Initialization'Access));
      Ret.Add_Test
        (Caller.Create ("Test_Start_Transition", Test_Start_Transition'Access));
      Ret.Add_Test
        (Caller.Create ("Test_Wait_Notify_Transition", Test_Wait_Notify_Transition'Access));
      Ret.Add_Test
        (Caller.Create ("Test_Sleep_Resume_Transition", Test_Sleep_Resume_Transition'Access));
      Ret.Add_Test
        (Caller.Create ("Test_Stop_Transition", Test_Stop_Transition'Access));
      Ret.Add_Test
        (Caller.Create ("Test_Undefined_Transition", Test_Undefined_Transition'Access));
      return Ret;
   end Suite;

end Thread_Suite;
