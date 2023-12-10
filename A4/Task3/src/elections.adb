package body Elections is
   -- Resets the number of made votes and votes for all parties to 0, and
   -- sets the number of total Voters to the given.
   procedure Initialize(Num_Voters: Natural) is
   begin
      Votes_Distribution := Zero_Votes_Distribution;
      Num_Votes_Made := 0;
      Num_Total_Voters := Num_Voters;
   end Initialize;

   procedure Vote_For(Vote: Party) is
   begin
      if Num_Votes_Made /= Natural'Last then
         Num_Votes_Made := Num_Votes_Made + 1;
         for Party_Value in Party loop
            if Party_Value = Vote then
               if Votes_Distribution(Party_Value) /= Natural'Last then
                  Votes_Distribution(Party_Value) := Votes_Distribution(Party_Value) + 1;
               end if;
            end if;
         end loop;
      end if;
   end Vote_For;

   function All_Voters_Voted return Boolean is
      bool : Boolean;
   begin
      if Num_Votes_Made = Num_Total_Voters then
         bool := True;
         return bool;
      else
         bool := False;
         return bool;
      end if;
   end All_Voters_Voted;

   function Find_Winner return Party is
      Winner : Party := None;
      Highest_count : Integer := 0;
      Equal_Votes : Integer := 0;
   begin
      for Party_Value in Party loop
         if Votes_Distribution(Party_Value) > Highest_count then
            Highest_count := Votes_Distribution(Party_Value);
            Winner := Party_Value;
         end if;
      end loop;
      for Party_Value in Party loop
         if Votes_Distribution(Party_Value) = Highest_count then
            Equal_Votes := Equal_Votes + 1;
         end if;
      end loop;
      if Equal_Votes = 1 then
         return Winner;
      else
         Winner := None;
         return Winner;
      end if;
   end Find_Winner;

end Elections;
