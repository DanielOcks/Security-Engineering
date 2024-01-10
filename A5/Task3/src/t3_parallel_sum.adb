with Ada.Text_IO;
with Parallel_Algorithms;

procedure T3_Parallel_Sum is
   package Integer_Sum is new Parallel_Algorithms(Item_Type => Integer, "+" => Standard."+");

   A : aliased Integer_Sum.Array_Type := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
   Result : Integer;

   type Integer_Array is array(Natural range <>) of Integer;

   A_Test : constant Integer_Array := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
   Result_Test : Integer := 0;

begin

   -- Print the original array
   Ada.Text_IO.Put("Original Array: ");
   for I in A'Range loop
      Ada.Text_IO.Put(Integer'Image(A(I)) & " ");
   end loop;
   Ada.Text_IO.New_Line;

   -- Calculate the sum in parallel
   Integer_Sum.Parallel_Sum(A'Access, Result);

   -- Print the result
   Ada.Text_IO.Put("Parallel Sum: " & Integer'Image(Result));
   Ada.Text_IO.New_Line;

   -- Calculate the sum sequential
   for J in A_Test'Range loop
      Result_Test := Result_Test + A_Test(J);
   end loop;

   -- Print the actual result
   Ada.Text_IO.Put("Sequential Sum: " & Integer'Image(Result_Test));
   Ada.Text_IO.New_Line;
end T3_Parallel_Sum;

