
package body Parallel_Algorithms is

   task body Sum_Task is
   begin
      for I in Start_Index .. End_Index loop
         Result.all := Result.all + Arr(I);
      end loop;
   end Sum_Task;

   procedure Parallel_Sum(Input: Array_Access_Type; Result: out Item_Type) is
      Mid_Index : constant Natural := Input'First + Input'Length / 2;
      Result_1 : aliased Item_Type;
      Result_2 : aliased Item_Type;
      Task_1 : Sum_Task (Input, Input'First, Mid_Index-1, Result_1'Access);
      Task_2 : Sum_Task (Input, Mid_Index, Input'Last, Result_2'Access);
   begin
      Result := Result_1 + Result_2;
   end Parallel_Sum;

end Parallel_Algorithms;
