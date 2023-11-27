with Ada.Text_IO; use Ada.Text_IO;
with Task_3;


procedure T3_Data_Flow is

begin
   Put_Line(Task_3.G(12, 0)'Image);
   Put(Natural'Image(Natural'Last));
end T3_Data_Flow;
