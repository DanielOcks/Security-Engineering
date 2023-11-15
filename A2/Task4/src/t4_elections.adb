with Ada.Text_IO; use Ada.Text_IO;
with AUnit.Assertions;
with Elections; use Elections;

procedure t4_elections is
   Fails : Integer := 0;
   procedure Test_Initialize is
      Num_Voters1 : Natural;
      Num_Voters2 : Natural;
   begin
      Num_Voters1 := 0;
      Num_Voters2 := 5;

      Initialize(Num_Voters1);
      AUnit.Assertions.Assert(Num_Total_Voters = 0, "Num of total Voters should be 0");
      AUnit.Assertions.Assert(Num_Votes_Made = 0, "Num of total votes made should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(None) = 0, "Votes for None should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(A) = 0, "Votes for A should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(B) = 0, "Votes for B should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(C) = 0, "Votes for C should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(D) = 0, "Votes for D should be 0");

      Initialize(Num_Voters2);
      AUnit.Assertions.Assert(Num_Total_Voters = 5, "Num of total Voters should be 5");
      AUnit.Assertions.Assert(Num_Votes_Made = 0, "Num of total votes made should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(None) = 0, "Votes for None should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(A) = 0, "Votes for A should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(B) = 0, "Votes for B should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(C) = 0, "Votes for C should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(D) = 0, "Votes for D should be 0");

   exception
      when others => Put_Line("Test_Initialize FAILED"); Fails := Fails +1;
   end Test_Initialize;

   procedure Test_Vote_For is
   Vote1 : Party;
   Vote2 : Party;
   begin
      Vote1 := A;
      Vote2 := B;
      Vote_For(Vote1);
      AUnit.Assertions.Assert(Votes_Distribution(None) = 0, "Votes for None should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(A) = 1, "Votes for A should be 1");
      AUnit.Assertions.Assert(Votes_Distribution(B) = 0, "Votes for B should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(C) = 0, "Votes for C should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(D) = 0, "Votes for D should be 0");

      Vote_For(Vote2);
      AUnit.Assertions.Assert(Votes_Distribution(None) = 0, "Votes for None should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(A) = 1, "Votes for A should be 1");
      AUnit.Assertions.Assert(Votes_Distribution(B) = 1, "Votes for B should be 1");
      AUnit.Assertions.Assert(Votes_Distribution(C) = 0, "Votes for C should be 0");
      AUnit.Assertions.Assert(Votes_Distribution(D) = 0, "Votes for D should be 0");

      exception
      when others => Put_Line("Test_Vote_For FAILED"); Fails := Fails + 1;
   end Test_Vote_For;

   procedure Test_All_Voters_Voted is
      bool1 : Boolean;
      bool2 : Boolean;
      bool3 : Boolean;
   begin
      Elections.Num_Votes_Made := 5;
      Elections.Num_Total_Voters := 5;
      bool1 := All_Voters_Voted;
      AUnit.Assertions.Assert(bool1, "Should be True");

      Elections.Num_Votes_Made := 10;
      Elections.Num_Total_Voters := 5;
      bool2 := All_Voters_Voted;
      AUnit.Assertions.Assert(bool2 = False, "Should be False");

      Elections.Num_Votes_Made := 5;
      Elections.Num_Total_Voters := 10;
      bool3 := All_Voters_Voted;
      AUnit.Assertions.Assert(bool3 = False, "Should be False");

      exception
      when others => Put_Line("Test_All_Voters_Voted FAILED"); Fails := Fails +1;
   end Test_All_Voters_Voted;

   procedure Find_Winner is
      Winner : Party;
   begin
      Vote_For(A); Vote_For(B); Vote_For(C); Vote_For(D); Vote_For(None); Vote_For(B);
      Winner := Find_Winner;
      AUnit.Assertions.Assert(Winner = B, "B should be the Winner");

      Vote_For(A);
      Winner := Find_Winner;
      AUnit.Assertions.Assert(Winner = None, "None should be the Winner");

      exception
      when others => Put_Line("Test_Find_Winner FAILED"); Fails := Fails +1;
   end Find_Winner;

   begin
   Test_Initialize;
   Test_Vote_For;
   Test_All_Voters_Voted;
   Find_Winner;
   if Fails = 0 then
      Put_Line("ALL TESTS WERE SUCCESSFUL");
   end if;

end t4_elections;
