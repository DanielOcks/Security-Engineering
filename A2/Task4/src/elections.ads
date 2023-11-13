package Elections is
   type Party is (None, A, B, C, D);
   type Votes_Array is array (Party) of Natural;

   Zero_Votes_Distribution : constant Votes_Array := (others => 0);
   Votes_Distribution : Votes_Array := Zero_Votes_Distribution;
   Num_Votes_Made : Natural := 0;
   Num_Total_Voters : Natural := 0;

   -- Resets the number of made votes and votes for all parties to 0,
   -- and sets the number of total Voters to the given value.
   procedure Initialize(Num_Voters: Natural)
     with Pre => Num_Total_Voters = 0 or Num_Total_Voters > 0,
          Post => Num_Total_Voters = Num_Total_Voters'Old or Num_Total_Voters > Num_Total_Voters'Old;


   procedure Vote_For(Vote: Party)
     with Pre => (Num_Votes_Made > 0 or Num_Votes_Made = 0) and (Vote = None or Vote = A or Vote = B or Vote = C or Vote = D),
          Post => Num_Votes_Made = Num_Votes_Made'Old +1 and Votes_Distribution(Vote) = Votes_Distribution(Vote)'Old +1;


   function All_Voters_Voted return Boolean;


   -- Returns Party with the most votes assigned.
   -- Returns None if multiple parties share the highest votes.
   function Find_Winner return Party
     with Post => (Find_Winner'Result = None or
                     Find_Winner'Result = A or
                       Find_Winner'Result = B or
                         Find_Winner'Result = C or
                           Find_Winner'Result = D);

end Elections;
