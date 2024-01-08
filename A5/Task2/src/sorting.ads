package Sorting is
   type Natural_Array is array ( Natural range <>) of Natural;
   
   procedure Selection_Sort(A: in out Natural_Array)
   with Pre => (A'Length >= 1);

end Sorting;
