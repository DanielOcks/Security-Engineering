package Thread is
   type State is (None, Ready, Running, Stopped, Sleeping, Waiting);
   type Action is (Notify, Resume, Sleep, Start, Stop, Wait);
   Invalid_State_Exc: exception;
   
   procedure Initialize(S: out State)
     with Pre => S = None,
       Post => S = Ready;
    -- Sets S to Ready.
   procedure Do_Action(S: in out State; A: Action)
     with Pre => (S /= None) or else
                   (S = Ready and A = Start) or else
                   ((S = Ready or S = Running) and A = Stop) or else
                   (S = Running and (A = Wait or A = Sleep)) or else
                   (S = Waiting and A = Notify) or else
                   (S = Sleeping and A = Resume),
           Post => (S = Running and A = Start) or else
                   (S = Stopped and A = Stop) or else
                   (S = Running and (A = Notify or A = Resume)) or else
                   (S = Waiting and A = Wait) or else
                   (S = Sleeping and A = Sleep) or else
                   (S = None);
    -- Updates the state S according to the given input state S, and the 
    -- given action A. Sets S to None if the transition is not defined.
end Thread;
