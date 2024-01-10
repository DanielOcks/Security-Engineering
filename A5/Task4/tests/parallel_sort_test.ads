with AUnit;
with AUnit.Test_Fixtures;

with Parallel_Sort;

package Parallel_Sort_Test is

   package PS is new Parallel_Sort(Item_Type => Natural, "=" => "=", "<" => "<");

   type Test is new AUnit.Test_Fixtures.Test_Fixture with null record;

   type CountArr is array(Natural range <>) of Natural;
   function Is_Sorted (Arr : in PS.Array_Type) return Boolean;
   function Is_Permutation (S, U : in PS.Array_Type) return Boolean;

   procedure Test_Sorting (T : in out Test);

end Parallel_Sort_Test;
