package body Sorting is
   
   procedure Selection_Sort(A: in out Natural_Array) is 
      Min_Index : Natural;
      procedure Swap(First, Second: in out Natural) is
         Temp : constant Natural := First;
      begin
         First := Second;
         Second := Temp;
      end Swap;
   begin
      for I in A'First .. A'Last-1 loop
         Min_Index := I;
         for J in I+1 .. A'Last loop
            pragma Loop_Invariant(Min_Index >= I and Min_Index < A'Last);
            if A(J) < A(Min_Index) then
               Min_Index := J;
            end if;
         end loop;
         Swap(A(I), A(Min_Index));
         pragma Loop_Invariant(A(I) <= A(I+1) or A(I) >= A(I+1));
      end loop;
   end Selection_Sort;

end Sorting;
