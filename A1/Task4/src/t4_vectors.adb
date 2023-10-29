with Ada.Text_IO;
with Vectors; use Vectors;

procedure t4_vectors is
   V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11: Vectors.Vector;
   Value1, Value2, Value3, Value4: Float;
   bool1, bool2, bool3, bool4: Boolean;
begin
   V1.X := 1.0;
   V1.Y := 2.0;
   V1.Z := 3.0;

   V2.X := 4.0;
   V2.Y := 5.0;
   V2.Z := 6.0;

   V6.X := 1.0;
   V6.Y := 0.0;
   V6.Z := 0.0;

   V7.X := 0.0;
   V7.Y := 1.0;
   V7.Z := 0.0;

   Value1 := 2.0;

   V3 := V1 + V2;
   V4 := V1 - V2;
   V5 := V1 * Value1;

   Value2 := V1 * V2;
   bool1 := V1 = V2;
   bool2 := Are_Orthogonal(V6, V7);
   V8 := Cross_Product(V1,V2);
   Value3 := Distance(V1, V2);
   Value4 := Distance_To_Origin(V1);
   V9.X := 1.0;
   V9.Y := 2.0;
   V9.Z := 3.0;
   bool3 := V1 = V9;
   bool4 := Are_Orthogonal(V1, V7);
   V10 := V1 * 0.0;
   V11 := V1 * (-1.0);

   Ada.Text_IO.Put("V1 := ");
   Put(V1); Ada.Text_IO.New_Line;
   Ada.Text_IO.Put("V2 := ");
   Put(V2); Ada.Text_IO.New_Line;
   Ada.Text_IO.Put("V9 := ");
   Put(V9); Ada.Text_IO.New_Line; Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("V1 + V2 = (" & Float'Image(V3.X) & ", " & Float'Image(V3.Y) & ", " & Float'Image(V3.Z) & ")");
   Ada.Text_IO.Put_Line("V1 - V2 = (" & Float'Image(V4.X) & ", " & Float'Image(V4.Y) & ", " & Float'Image(V4.Z) & ")");
   Ada.Text_IO.Put_Line("V1 * 5.0 = (" & Float'Image(V5.X) & ", " & Float'Image(V5.Y) & ", " & Float'Image(V5.Z) & ")");
   Ada.Text_IO.Put_Line("V1 * 0 = (" & Float'Image(V10.X) & ", " & Float'Image(V10.Y) & ", " & Float'Image(V10.Z) & ")");
   Ada.Text_IO.Put_Line("V1 * -1 = (" & Float'Image(V11.X) & ", " & Float'Image(V11.Y) & ", " & Float'Image(V11.Z) & ")");
   Ada.Text_IO.Put_Line("V1 * V2 = "& Float'Image(Value2));
   Ada.Text_IO.Put_Line("V1 = V2: " &Boolean'Image(bool1));
   Ada.Text_IO.Put_Line("V1 = V9: " &Boolean'Image(bool3));
   Ada.Text_IO.Put_Line("Orthogonal: " &Boolean'Image(bool2));
   Ada.Text_IO.Put_Line("Orthogonal: " &Boolean'Image(bool4));
   Ada.Text_IO.Put_Line("Cross Product: (" & Float'Image(V8.X) & ", " & Float'Image(V8.Y) & ", " & Float'Image(V8.Z) & ")");
   Ada.Text_IO.Put_Line("Distance = "& Float'Image(Value3));
   Ada.Text_IO.Put_Line("Distance to origin = "& Float'Image(Value4));

end t4_vectors;


















































