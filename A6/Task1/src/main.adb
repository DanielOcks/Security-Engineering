with Ada.Text_IO;
with GF2n;

procedure Main is
   type GF_2_4_Type is mod 2**4;

   package GF is new GF2n(Element_Type => GF_2_4_Type, P => 2**8);
   X, Y, GCD_Result: GF_2_4_Type;

begin
   X := 5 ;
   Y := 9;

   Ada.Text_IO.Put_Line("Galois Field Operations Example:");

   Ada.Text_IO.Put("X + Y = ");
   Ada.Text_IO.Put_Line(GF."+"(X, Y)'Image);

   Ada.Text_IO.Put("X - Y = ");
   Ada.Text_IO.Put_Line(GF."-"(X, Y)'Image);

   Ada.Text_IO.Put("X * Y = ");
   Ada.Text_IO.Put_Line(GF."*"(X, Y)'Image);

   Ada.Text_IO.Put("X / Y = ");
   Ada.Text_IO.Put_Line(GF."/"(X, Y)'Image);

   Inverse_X := GF.Find_Inverse(X);
   Ada.Text_IO.Put("Inverse of X = ");
   Ada.Text_IO.Put_Line(Inverse_X'Image);

   GCD_Result := GF.GCD(X, Y);
   Ada.Text_IO.Put("GCD of X and Y = ");
   Ada.Text_IO.Put_Line(GCD_Result'Image);

   Ada.Text_IO.Put("Is X a primitive element? ");
   Ada.Text_IO.Put_Line(Boolean'Image(GF.Is_Primitive(X)));

   Ada.Text_IO.Put("Is Y a primitive element? ");
   Ada.Text_IO.Put_Line(Boolean'Image(GF.Is_Primitive(Y)));

end Main;
