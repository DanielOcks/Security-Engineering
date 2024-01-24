
package body GF2n is
   function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return X xor Y;
   end "+";

   function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return X xor Y;
   end "-";

   -- function "*"(X: Element_Type; Y: Element_Type) return Element_Type;

   function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return X * Find_Inverse(Y);
   end "/";

   function Find_Inverse(X: Element_Type) return Element_Type is
      n: Element_Type := P;
      b,q,r,t1,t2,t3 : Element_Type;
   begin
      if GCD(X,n) = 1 then
         b := X;
         q := n / b;
         r := n mod b;
         t1 := 0;
         t2 := 1;
         t3 := t1-(q*t2);
         while r /= 1 loop
            n := b;
            b := r;
            q := n / b;
            r := n mod b;
            t1 := t2;
            t2 := t3;
            t3 := t1-(q*t2);
         end loop;
      end if;
      return t3 mod P;
   end Find_Inverse;

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

   -- function Is_Primitive(X: Element_Type) return Boolean;

end GF2n;
