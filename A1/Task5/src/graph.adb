package body Graph is
   procedure Add_Vertex(Vertex: Vertex_Type) is
   begin
      for existing of Vertices loop
         if Vertex = existing then
            raise Vertex_Already_In_Graph_Exception;
         end if;
      end loop;
      Vertices.Append(New_Item => Vertex);
   end Add_Vertex;
   
   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
      E : constant Edge_Type := (From, To, Weight);
   begin
      for Edge of Edges loop
         if From = Edge.from and To = Edge.To then
            Edge.Weight := Weight;
            return;
         end if; 
      end loop;
      Edges.Append(New_Item => E);
   end Add_Edge;
   
   procedure Clear is
   begin
      Edges.Clear;
      Vertices.Clear;
   end Clear;
   
   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
   begin
      for Edge of Edges loop
         if From = Edge.from and To = Edge.To then
            return Edge.Weight;
         end if; 
      end loop;
      raise Edge_Not_Found_Exception;
   end Get_Edge_Weight;
   
   function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin
      for Edge of Edges loop
         if From = Edge.from and To = Edge.To then
            return True;
         end if; 
      end loop;
      return False;
   end Has_Edge;
   
   function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin
      for Edge_Index in Edges.First_Index .. Edges.Last_Index loop
         if From = Edges(Edge_Index).From and To = Edges(Edge_Index).To then
            Edges.Delete(Index => Edge_Index);
            return True;
         end if; 
      end loop;
      raise Edge_Not_Found_Exception;
   end Remove_Edge;
   
   function To_Vertex_Array return Vertex_Array is
      Return_Array : Vertex_Array(Vertices.First_Index .. Vertices.Last_Index);
   begin
      for Vertex_Index in Vertices.First_Index .. Vertices.Last_Index loop
         Return_Array(Vertex_Index) := Vertices(Vertex_Index);
      end loop;
      return Return_Array;
   end To_Vertex_Array;
   
end Graph;
