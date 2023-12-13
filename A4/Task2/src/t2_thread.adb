with Thread; use Thread;
with Ada.Text_IO;

procedure T2_Thread is
   S: Thread.State;
begin
   Thread.Initialize(S);
   Ada.Text_IO.Put_Line("Initialized state: " & Thread.State'Image(S));
   if S /= None then
      Thread.Do_Action(S, Thread.Start);
      Ada.Text_IO.Put_Line("State after Start action: " & Thread.State'Image(S));
   end if;

   if S /= None then
      Thread.Do_Action(S, Thread.Wait);
      Ada.Text_IO.Put_Line("State after Wait action: " & Thread.State'Image(S));
   end if;
   if S /= None then
      Thread.Do_Action(S, Thread.Notify);
      Ada.Text_IO.Put_Line("State after Notify action: " & Thread.State'Image(S));
   end if;
   if S /= None then
      Thread.Do_Action(S, Thread.Sleep);
      Ada.Text_IO.Put_Line("State after Sleep action: " & Thread.State'Image(S));
   end if;
   if S /= None then
      Thread.Do_Action(S, Thread.Stop);
      Ada.Text_IO.Put_Line("State after Wait action: " & Thread.State'Image(S));
   end if;


end T2_Thread;
