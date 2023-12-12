package body Thread is

   procedure Initialize(S: out State) is 
   begin
      S := Ready;
   end Initialize;
   
   procedure Do_Action(S: in out State; A: Action) is 
   begin 
      case S is
         when Ready =>
            case A is 
               when Start =>
                  S := Running;
               when Stop =>
                  S := Stopped;
               when others =>
                  S := None;
            end case;
            
          when Running =>
            case A is 
               when Wait =>
                  S := Waiting;
               when Sleep =>
                  S := Sleeping;
               when Stop =>
                  S := Stopped;
               when others =>
                  S := None;
            end case;
            
          when Waiting =>
            case A is 
               when Notify =>
                  S := Running;
               when others =>
                  S := None;
            end case;
            
          when Sleeping =>
            case A is 
               when Resume =>
                  S := Running;
               when others =>
                  S := None;
            end case;
            
          when Stopped =>
             S := None;
            
          when None =>
             raise Invalid_State_Exc;
      end case;
      
   end Do_Action;

end Thread;
