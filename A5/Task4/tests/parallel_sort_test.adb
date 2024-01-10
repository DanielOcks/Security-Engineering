with AUnit.Assertions; use AUnit.Assertions;

package body Parallel_Sort_Test is

   unsorted2 : aliased PS.Array_Type := (0, 5, 2, 6, 5, 7, 4, 1, 9, 3);
   unsorted1 : aliased PS.Array_Type := (9, 8, 7, 6, 5, 4, 3, 2, 1, 0);
   unsorted3 : aliased PS.Array_Type := (0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
   -- meh, fine for testing with same sized arrays
   sorted : aliased PS.Array_Type := unsorted1;

   function Is_Sorted (Arr : in PS.Array_Type) return Boolean is
   begin
      for I in Arr'First .. Arr'Last-1 loop
         if Arr(I) > Arr(I+1) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Sorted;

   function Is_Permutation (S, U : in PS.Array_Type) return Boolean is
      CountS : CountArr (S(S'First) .. S(S'Last)) := (others => 0);
      CountU : CountArr (S(S'First) .. S(S'Last)) := (others => 0);
   begin
      for I in S'First .. S'Last loop
         CountS(S(I)) := CountS(S(I))+1;
      end loop;
      for I in U'First .. U'Last loop
         CountU(U(I)) := CountU(U(I))+1;
      end loop;
      for I in CountS'First .. CountS'Last loop
         if CountS(I) /= CountU(I) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Permutation;

   procedure Test_Sorting (T : in out Test) is
      pragma Unreferenced (T);
      unsorted1_access : constant PS.Array_Access_Type := unsorted1'Access;
      unsorted2_access : constant PS.Array_Access_Type := unsorted2'Access;
      unsorted3_access : constant PS.Array_Access_Type := unsorted3'Access;
      sorted_access : constant PS.Array_Access_Type := sorted'Access;
   begin
      PS.Parallel_Merge_Sort(unsorted1_access, sorted_access);
      Assert(Is_Sorted(sorted) and Is_Permutation(sorted, unsorted1), "Random Array sorted incorrectly");
      PS.Parallel_Merge_Sort(unsorted2_access, sorted_access);
      Assert(Is_Sorted(sorted) and Is_Permutation(sorted, unsorted2), "Inversly sorted Array sorted incorrectly");
      PS.Parallel_Merge_Sort(unsorted3_access, sorted_access);
      Assert(Is_Sorted(sorted) and Is_Permutation(sorted, unsorted3), "Sorted Array sorted incorrectly");
   end Test_Sorting;

end Parallel_Sort_Test;