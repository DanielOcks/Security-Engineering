with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

package body Vectors is
   function "+"(Left: Vector; Right: Vector) return Vector is
      Result: Vector;
   begin
      Result.X := Left.X + Right.X;
      Result.Y := Left.Y + Right.Y;
      Result.Z := Left.Z + Right.Z;
      return Result;
   end "+";

   function "-"(Left: Vector; Right: Vector) return Vector is
      Result: Vector;
   begin
      Result.X := Left.X - Right.X;
      Result.Y := Left.Y - Right.Y;
      Result.Z := Left.Z - Right.Z;
      return result;
   end "-";

   function "*"(Left: Vector; Right: Float) return Vector is
      Result: Vector;
   begin
      Result.X := Left.x * Right;
      Result.Y := Left.y * Right;
      Result.Z := Left.Z * Right;
      return Result;
   end "*";

   function "*"(Left: Vector; Right: Vector) return Float is
      Result: Float;
   begin
      Result := Left.X * Right.X + Left.Y * Right.Y + Left.Z * Right.Z;
      return Result;
   end "*";

   function "="(Left: Vector; Right: Vector) return Boolean is
      bool: Boolean;
   begin
      if Left.X /= Right.X or Left.Y /= Right.Y or Left.Z /= Right.Z then
         bool := False;
      else
         bool := True;
      end if;
      return bool;
   end "=";

   function Are_Orthogonal(Left: Vector; Right: Vector) return Boolean is
      bool: Boolean;
   begin
      if Left * Right = 0.0 then
         bool := True;
         return bool;
      else
         bool := False;
         return bool;
      end if;
   end Are_Orthogonal;

   function Cross_Product(Left: Vector; Right: Vector) return Vector is
      Result: Vector;
   begin
      Result.X := Left.Y * Right.Z - Left.Z * Right.Y;
      Result.Y := Left.Z * Right.X - Left.X * Right.Z;
      Result.Z := Left.X * Right.Y - Left.Y * Right.X;
      return Result;
   end Cross_Product;

   function Distance(Left: Vector; Right: Vector) return Float is
      Result, X, Y ,Z, Number: Float;
   begin
      X := (Left.X - Right.X)**2;
      Y := (Left.Y - Right.Y)**2;
      Z := (Left.Z - Right.Z)**2;
      Number := X+Y+Z;
      Result := Ada.Numerics.Elementary_Functions.Sqrt(Number);
      Return Result;
   end Distance;

   function Distance_To_Origin(Item: Vector) return Float is
      Result, X, Y, Z, Number: Float;
   begin
      X := Item.X ** 2;
      Y := Item.Y ** 2;
      Z := Item.Z ** 2;
      Number := X+Y+Z;
      Result := Ada.Numerics.Elementary_Functions.Sqrt(Number);
      return Result;
   end Distance_To_Origin;

   procedure Put(Item: Vector) is
   begin
      Ada.Text_IO.Put("(" & Float'Image(Item.X) & "," & Float'Image(Item.Y) & "," & Float'Image(Item.Z) & ")");
   end Put;
   -- Prints the vector in the format (X, Y, Z).
end Vectors;
