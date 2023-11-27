with Ada.Text_IO; use Ada.Text_IO;
with AUnit.Assertions;
with Vectors; use Vectors;

procedure T2_Testing_Coverage_Vectors is
   Fails : Integer := 0;
   procedure Test_Addition is
   begin
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) + (4.0, 5.0, 6.0) = (5.0, 7.0, 9.0), "(1.0, 2.0, 3.0) + (4.0, 5.0, 6.0) should be (5.0, 7.0, 9.0)");
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) + (-4.0, -5.0, -6.0) = (-3.0, -3.0, -3.0), "(1.0, 2.0, 3.0) + (-4.0, -5.0, -6.0) should be (-3.0, -3.0, -3.0)");
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) + (0.0, 0.0, 0.0) = (1.0, 2.0, 3.0), "(1.0, 2.0, 3.0) + (0.0, 0.0, 0.0) should be (1.0, 2.0, 3.0)");
   exception
      when others => Put_Line("Test_Addition FAILED"); Fails := Fails +1;
   end Test_Addition;

   procedure Test_Subtraction is
   begin
      AUnit.Assertions.Assert((6.0, 5.0, 4.0) - (3.0, 2.0, 1.0) = (3.0, 3.0, 3.0), "(6.0, 5.0, 4.0) - (3.0, 2.0, 1.0) should be (3.0, 3.0, 3.0)");
      AUnit.Assertions.Assert((6.0, 5.0, 4.0) - (-3.0, -2.0, -1.0) = (9.0, 7.0, 5.0), "(6.0, 5.0, 4.0) - (3.0, 2.0, 1.0) should be (3.0, 3.0, 3.0)");
      AUnit.Assertions.Assert((6.0, 5.0, 4.0) - (0.0, 0.0, 0.0) = (6.0, 5.0, 4.0), "(6.0, 5.0, 4.0) - (0.0, 0.0, 0.0) should be (6.0, 5.0, 4.0)");
   exception
      when others => Put_Line("Test_Subtraction FAILED"); Fails := Fails +1;
   end Test_Subtraction;

   procedure Test_Multiplication is
   begin
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) * 2.0 = (2.0, 4.0, 6.0), "(1.0, 2.0, 3.0) * 2.0 should be (2.0, 4.0, 6.0)");
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) * 0.0 = (0.0, 0.0, 0.0), "(1.0, 2.0, 3.0) * 0 should be (0.0, 0.0, 0.0)");
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) * (-1.0) = (-1.0, -2.0, -3.0), "(1.0, 2.0, 3.0) * -1.0 should be (-1.0, -2.0, -3.0)");
   exception
      when others => Put_Line("Test_Multiplication FAILED"); Fails := Fails +1;
   end Test_Multiplication;

   procedure Test_Scalar_Product is
   begin
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) * (1.0, 2.0, 3.0) = 14.0, "(1.0, 2.0, 3.0) * (1.0, 2.0, 3.0) should be 14.0");
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) * (0.0, 0.0, 0.0) = 0.0, "(1.0, 2.0, 3.0) * (0.0, 0.0, 0.0) should be 0.0");
      AUnit.Assertions.Assert((1.0, 2.0, 3.0) * (-1.0, -2.0, -3.0) = -14.0, "(1.0, 2.0, 3.0) * (-1.0, -2.0, -3.0) should be -14.0");
   exception
      when others => Put_Line("Test_Scalar_Product FAILED"); Fails := Fails +1;
   end Test_Scalar_Product;

   procedure Test_Equal is
   begin
      AUnit.Assertions.Assert(Vectors."="((0.0, 0.0, 0.0), (0.0, 0.0, 0.0)) = True, "(0.0, 0.0, 0.0) = (0.0, 0.0, 0.0) should be True");
      AUnit.Assertions.Assert(Vectors."="((0.0, 0.0, 0.0), (0.0, 1.0, 0.0)) = False, "(0.0, 0.0, 0.0) = (0.0, 1.0, 0.0) should be False");
   exception
      when others => Put_Line("Test_Equal FAILED"); Fails := Fails +1;
   end Test_Equal;

   procedure Test_Are_Orthogonal is
   begin
      AUnit.Assertions.Assert(Are_Orthogonal((1.0, 0.0, 0.0), (0.0, 1.0, 0.0)) = True, "(1.0, 0.0, 0.0) and (0.0, 1.0, 0.0) should be True(Orthogonal)");
      AUnit.Assertions.Assert(Are_Orthogonal((1.0, 0.0, 0.0), (1.0, 1.0, 1.0)) = False, "(1.0, 0.0, 0.0) and (1.0, 1.0, 1.0) should be False(Not Orthogonal)");
   exception
      when others => Put_Line("Test_Are_Orthogonal FAILED"); Fails := Fails +1;
   end Test_Are_Orthogonal;

   procedure Test_Cross_Product is
   begin
      AUnit.Assertions.Assert(Cross_Product((1.0, 2.0, 3.0), (1.0, 2.0, 3.0)) = (0.0, 0.0, 0.0), "(1.0, 2.0, 3.0) x (1.0, 2.0, 3.0) should be (0.0, 0.0, 0.0)");
      AUnit.Assertions.Assert(Cross_Product((1.0, 2.0, 3.0), (-4.0, -5.0, -6.0)) = (3.0, -6.0, 3.0), "(1.0, 2.0, 3.0) x (-4.0, -5.0, -6.0) should be (3.0, -6.0, 3.0)");
      AUnit.Assertions.Assert(Cross_Product((1.0, 2.0, 3.0), (0.0, 0.0, 0.0)) = (0.0, 0.0, 0.0), "(1.0, 2.0, 3.0) x (0.0, 0.0, 0.0) should be (0.0, 0.0, 0.0)");
   exception
      when others => Put_Line("Test_Cross_Product FAILED"); Fails := Fails +1;
   end Test_Cross_Product;

   procedure Test_Distance is
   begin
      AUnit.Assertions.Assert(Distance((1.0, 2.0, 3.0), (1.0, 2.0, 3.0)) = 0.0, "Distance between (1.0, 2.0, 3.0) and (1.0, 2.0, 3.0) should be 0.0");
      AUnit.Assertions.Assert(Distance((1.0, 2.0, 3.0), (-1.0, -2.0, -3.0)) = 7.48331477, "Distance between (1.0, 2.0, 3.0) and (-1.0, -2.0, -3.0) should be 7.48331477");
   exception
      when others => Put_Line("Test_Distance FAILED"); Fails := Fails +1;
   end Test_Distance;

   procedure Test_Distance_To_Origin is
   begin
      AUnit.Assertions.Assert(Distance_To_Origin((1.0, 2.0, 3.0)) = 3.74165738, "Distance between (1.0, 2.0, 3.0) and the origin should be 3.74165738");
      AUnit.Assertions.Assert(Distance_To_Origin((-1.0, -2.0, -3.0)) = 3.74165738, "Distance between (-1.0, -2.0, -3.0) and the origin should be 3.74165738");
   exception
      when others => Put_Line("Test_Distance_To_Origin FAILED"); Fails := Fails +1;
   end Test_Distance_To_Origin;

begin
   Test_Addition;
   Test_Subtraction;
   Test_Multiplication;
   Test_Scalar_Product;
   Test_Equal;
   Test_Are_Orthogonal;
   Test_Cross_Product;
   Test_Distance;
   Test_Distance_To_Origin;
   if Fails = 0 then
      Put_Line("ALL TESTS WERE SUCCESSFUL");
	end if;
end T2_Testing_Coverage_Vectors;

