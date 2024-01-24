with Ada.Text_IO; use Ada.Text_IO;

procedure test_main is
   type Element_Type is mod 2**8;

   procedure Plus(X: Element_Type; Y: Element_Type) is
      Result: Element_Type;
   begin
      Result := X xor Y;
      Put_Line(Result'Image);
   end Plus;

   procedure Minus(X: Element_Type; Y: Element_Type) is
      Result: Element_Type;
   begin
      Result := X - Y;
      Put_Line(Result'Image);
   end Minus;

   procedure Multiplication(X: Element_Type; Y: Element_Type) is
      Result: Element_Type;
   begin
      Result := X * Y;
      Put_Line(Result'Image);
   end Multiplication;
   
   procedure Division(X: Element_Type; Y: Element_Type) is
      Result: Element_Type;
   begin
      Result := X / Y;
      Put_Line(Result'Image);
   end Division;

   function GCD(X: Element_Type; Y: Element_Type) return Element_Type is
   Temp : Element_Type;
   Temp_X : Element_Type := X;
   Temp_Y : Element_Type := Y;
   begin
      while Temp_X /= Temp_Y loop
         if Temp_Y > Temp_X then
            Temp := Temp_X;
            Temp_X := Temp_Y;
            Temp_Y := Temp;
         end if;
         Temp_X := Temp_X - Temp_Y;
      end loop;
      return Temp_X;
   end GCD;
   
   procedure Find_Inverse(X: Element_Type) is
      n,b,q,r,t1,t2,t3 : Element_Type;
   begin
      n := 2**8;
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
      Put_Line(t3'Image);
   end Find_Inverse;

   X: constant Element_Type := 13;
   Y: constant Element_Type := 12;
   Z: Element_Type;
begin
   Plus(X, Y);
   Minus(X, Y);
   Multiplication(X, Y);
   Division(X,Y);
   Find_Inverse(X);
   Z := GCD(X,Y);
   Put_Line(Z'Image);
   
end test_main;
