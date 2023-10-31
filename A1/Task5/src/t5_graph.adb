with Ada.Text_IO;
with Graph;

procedure t5_graph is

    package G is new Graph (Vertex_Type => Integer, "=" => Standard."=");

    V1, V2, V3, V4, V5 : Integer;
    TempI : Integer := 1;
    TempB : Boolean := True;
begin
    V1 := 1;
    V2 := 2;
    V3 := 3;
    V4 := 4;
    V5 := 5;
    -- Setup basic Graph
    G.Add_Vertex(V1);
    G.Add_Vertex(V2);
    G.Add_Vertex(V3);
    G.Add_Vertex(V4);
    G.Add_Vertex(V5);
    G.Add_Edge(V1, V2, 2);
    G.Add_Edge(V1, V3, 3);
    G.Add_Edge(V2, V4, 4);
    G.Add_Edge(V3, V5, 5);
    G.Add_Edge(V4, V1, 6);

   -- Check Vertex_Already_In_Graph_Exception
    begin
        G.Add_Vertex(V1);
    exception
        when G.Vertex_Already_In_Graph_Exception =>
            Ada.Text_IO.Put_Line("V1 already Exists");
    end;
    begin
        G.Add_Vertex(V3);
    exception
        when G.Vertex_Already_In_Graph_Exception =>
            Ada.Text_IO.Put_Line("V3 already Exists");
    end;

    -- Check Get_Edge_Weight
    Ada.Text_IO.Put_Line("Edge from V1 to V2 has weight: " & G.Get_Edge_Weight(V1, V2)'Image);
    Ada.Text_IO.Put_Line("Edge from V2 to V4 has weight: " & G.Get_Edge_Weight(V2, V4)'Image);
    begin
        TempI := G.Get_Edge_Weight(V1, V5);
    exception
        when G.Edge_Not_Found_Exception =>
            Ada.Text_IO.Put_Line("No Edge from V1 to V5");
    end;
    begin
        TempI := G.Get_Edge_Weight(V1, V4);
    exception
        when G.Edge_Not_Found_Exception =>
            Ada.Text_IO.Put_Line("No Edge from V1 to V4");
    end;

    -- Check reassigned Weights
    G.Add_Edge(V2, V4, 8);
    G.Add_Edge(V3, V5, 12);
    Ada.Text_IO.Put_Line("Edge from V2 to V4 has weight: " & G.Get_Edge_Weight(V2, V4)'Image);
    Ada.Text_IO.Put_Line("Edge from V3 to V5 has weight: " & G.Get_Edge_Weight(V3, V5)'Image);

    -- Check Has_Edge and Remove_Edge
    if G.Has_Edge(V4, V1) = True then
        Ada.Text_IO.Put_Line("Edge from V4 to V1 exists");
    end if;
    if G.Has_Edge(V1, V4) = False then
        Ada.Text_IO.Put_Line("Edge from V1 to V4 does not exists");
    end if;
    TempB := G.Remove_Edge(V4, V1);
    begin
        TempB := G.Remove_Edge(V4, V1);
    exception
        when G.Edge_Not_Found_Exception =>
            Ada.Text_IO.Put_Line("Edge from V4 to V1 was already removed");
    end;
    if G.Has_Edge(V4, V1) = False then
        Ada.Text_IO.Put_Line("Edge from V4 to V1 no longer exists");
    end if;

    G.Clear;
    if G.Has_Edge(V1, V2) = False then
        Ada.Text_IO.Put_Line("Edge from V1 to V2 no longer exists");
    end if;
    if G.Has_Edge(V1, V3) = False then
        Ada.Text_IO.Put_Line("Edge from V1 to V3 no longer exists");
    end if;
    G.Add_Vertex(V1);
    G.Add_Vertex(V3);
    G.Add_Vertex(V5);

    Ada.Text_IO.Put_Line("TempI still " & TempI'Image);
    Ada.Text_IO.Put_Line("TempB still " & TempB'Image);

    declare
        Arr : constant G.Vertex_Array := G.To_Vertex_Array;
    begin
        for Elem of Arr loop
            Ada.Text_IO.Put_Line(Elem'Image);
        end loop;
    end;

end t5_graph;
