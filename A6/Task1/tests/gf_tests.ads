with AUnit;
with AUnit.Test_Fixtures;

package GF_Tests is
   type Test is new AUnit.Test_Fixtures.Test_Fixture with null record;
   
   procedure Test_Array_1(T : in out Test);
   

end GF_Tests;
