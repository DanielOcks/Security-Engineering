with AUnit;
with AUnit.Test_Fixtures;

package Murmur_Hash2.Test is

   type Test is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Hashing (T : in out Test);

end Murmur_Hash2.Test;
