
package body GF2n is
   function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return X xor Y;
   end "+";

   function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return X - Y;
   end "-";

   -- TODO function "*"
   function "*"(X: Element_Type; Y: Element_Type) return Element_Type is
      return X * Y;
   begin

   end

   function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return X * Find_Inverse(Y);
   end "/";

   -- function Find_Inverse(X: Element_Type) return Element_Type is


   function GCD(X: Element_Type; Y: Element_Type) return Element_Type is
      A : Element_Type := X;
      B : Element_Type := Y;
      C : Element_Type;
   begin
      while B /= 0 loop
         C := A;
         A := B;
         B := C mod B;
      end loop;

      return A;
   end GCD;

end GF2n;
