with Ada.Text_IO;
with Ada.Assertions;
with Thread;


procedure Main_Threads is
   S: Thread.State;
   A: Thread.Action;

begin
   -- Test Initialize procedure
   Thread.Initialize(S);
   Ada.Text_IO.Put_Line("Initialized state: " & Thread.State'Image(S));

   -- Test Do_Action procedure for each state and action
   -- Test for Ready state
   A := Thread.Start;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;

   Ada.Text_IO.Put_Line("State after Start action: " & Thread.State'Image(S));

   -- Test for Running state
   A := Thread.Wait;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;

   Ada.Text_IO.Put_Line("State after Wait action: " & Thread.State'Image(S));

   -- Test for invalid actions
   A := Thread.Sleep;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;

   Ada.Text_IO.Put_Line("State after Sleep action: " & Thread.State'Image(S));

   A := Thread.Stop;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;

   Ada.Text_IO.Put_Line("State after Stop action: " & Thread.State'Image(S));

   -- Test for Waiting state
   A := Thread.Notify;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;

   Ada.Text_IO.Put_Line("State after Notify action: " & Thread.State'Image(S));

   -- Test for Sleeping state
   A := Thread.Sleep;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;

   Ada.Text_IO.Put_Line("State after Sleep action: " & Thread.State'Image(S));

   -- Test Resume action
   A := Thread.Resume;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;

   Ada.Text_IO.Put_Line("State after Resume action: " & Thread.State'Image(S));

   -- Test Stop action
   A := Thread.Stop;
   begin
      Thread.Do_Action(S, A);
   exception
         when ADA.ASSERTIONS.ASSERTION_ERROR =>
         Ada.Text_IO.Put_Line(Thread.Action'Image(A) & " is invalid action to the current state " & Thread.State'Image(S));
   end;
   Ada.Text_IO.Put_Line("State after Stop action: " & Thread.State'Image(S));

end Main_Threads;
