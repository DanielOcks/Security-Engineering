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
     with Global  => (Output => (Votes_Distribution, Num_Votes_Made, Num_Total_Voters)),
          Depends => (Votes_Distribution => null,
                      Num_Votes_Made     => null,
                      Num_Total_Voters   => Num_Voters),
          Pre     => (Num_Voters > 0),
          Post    => Num_Votes_Made = 0;


   procedure Vote_For(Vote: Party)
     with Global  => (In_Out  => (Num_Votes_Made, Votes_Distribution)),
          Depends => (Num_Votes_Made     => Num_Votes_Made,
                      Votes_Distribution => (Votes_Distribution, Vote, Num_Votes_Made)),
          Pre     => (Num_Votes_Made > 0 or Num_Votes_Made = 0) and
                     (Vote = None or Vote = A or Vote = B or Vote = C or Vote = D),
          Post    => (Num_Votes_Made > Num_Votes_Made'Old or Num_Votes_Made = Num_Votes_Made'Old) and
                     (Votes_Distribution(Vote) > Votes_Distribution(Vote)'Old or Votes_Distribution(Vote) = Votes_Distribution(Vote)'Old);

   function All_Voters_Voted return Boolean
     with Global  => (Input  => (Num_Total_Voters, Num_Votes_Made));
   -- No depends needed here, because no global outputs, just inputs.

   -- Returns Party with the most votes assigned.
   -- Returns None if multiple parties share the highest votes.
   function Find_Winner return Party
     with Global  => (Input  => Votes_Distribution),
   -- No depends needed here, because no global outputs, just inputs.
          Post => (Find_Winner'Result = None or
                     Find_Winner'Result = A or
                       Find_Winner'Result = B or
                         Find_Winner'Result = C or
                           Find_Winner'Result = D);

end Elections;
