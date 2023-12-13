package Thread is
   type State is (None, Ready, Running, Stopped, Sleeping, Waiting);
   type Action is (Notify, Resume, Sleep, Start, Stop, Wait);
   Invalid_State_Exc: exception;
   
   -- We could not define global and depends here because there are no 
   -- global variable 
   -- with a pre condition for Initialize that should be S = None, the project 
   -- does not compile 
   procedure Initialize(S: out State)
     with
       Post => S = Ready;
    -- Sets S to Ready.
   procedure Do_Action(S: in out State; A: Action)
     with
       Pre => S /= None,
       Post => (S = Running and A = Start) or else
                   (S = Stopped and A = Stop) or else
                   (S = Running and (A = Notify or A = Resume)) or else
                   (S = Waiting and A = Wait) or else
                   (S = Sleeping and A = Sleep) or else
                   (S = None);
    -- Updates the state S according to the given input state S, and the 
    -- given action A. Sets S to None if the transition is not defined.
end Thread;
