--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;
with Sorting;

procedure T2_Selection_Sort is
   A: Sorting.Natural_Array := (5, 2, 4, 1, 3);

begin
   Ada.Text_IO.Put_Line("Unsorted A: " );
   for I in A'Range loop
      Ada.Text_IO.Put(Integer'Image(A(I)) & " ");
   end loop;
   Ada.Text_IO.New_Line;

   Sorting.Selection_Sort(A);

   Ada.Text_IO.Put_Line("Sorted array: ");
   for I in A'Range loop
      Ada.Text_IO.Put(Integer'Image(A(I)) & " ");
   end loop;
   Ada.Text_IO.New_Line;
end T2_Selection_Sort;
