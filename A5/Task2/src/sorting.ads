package Sorting is
   type Natural_Array is array (Natural range <>) of Natural;
   
   --procedure Swap(First, Second: in out Natural)
     --with Pre  => (First = First and Second = Second),
          --Post => (First = Second'Old and Second = First'Old);
   
   -- We tried really hard, but finding a working postcondition for this case is...
   procedure Selection_Sort(A: in out Natural_Array)
       with Pre  => (A'Length >= 1),
            Post => (for all I in A'First .. A'Last-1 => A(I) <= A(I+1));
   
end Sorting;
