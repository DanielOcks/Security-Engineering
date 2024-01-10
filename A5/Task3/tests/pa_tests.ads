with AUnit;
with AUnit.Test_Fixtures;

package PA_Tests is

   type Test is new AUnit.Test_Fixtures.Test_Fixture with null record;
   
   procedure Test_Array_1(T : in out Test);
   procedure Test_Array_2(T : in out Test);
   procedure Test_Array_3(T : in out Test);
   procedure Test_Array_4(T : in out Test);

end PA_Tests;
