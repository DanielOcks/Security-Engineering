with AUnit.Test_Caller;

with Binary_Trees_Tests; use Binary_Trees_Tests;

package body Binary_Trees_Suite is

   package Caller is new AUnit.Test_Caller (Test);

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      Ret : constant AUnit.Test_Suites.Access_Test_Suite := new AUnit.Test_Suites.Test_Suite;
   begin
      Ret.Add_Test (Caller.Create ("Test Creation of Root Node", Test_Create'Access));
      Ret.Add_Test (Caller.Create ("Test Adding Items", Test_Add'Access));
      Ret.Add_Test (Caller.Create ("Test Removing Items", Test_Rem'Access));
      Ret.Add_Test (Caller.Create ("Test Removing All", Test_RemAll'Access));

      return Ret;
   end Suite;

end Binary_Trees_Suite;
