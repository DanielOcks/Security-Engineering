with Ada.Containers.Vectors;

generic
    type Vertex_Type is private;
    with function "="(Left: Vertex_Type; Right: Vertex_Type) return Boolean;
package Graph is
    Edge_Not_Found_Exception: exception;
    Vertex_Already_In_Graph_Exception: exception;

    type Edge_Type is private;
    type Vertex_Array is array(Natural range <>) of Vertex_Type;

    procedure Add_Vertex(Vertex: Vertex_Type);
    -- Stores the Vertex in the Graph. Raises a 
    -- Vertex_Already_In_Graph_Exception if it is already in the graph.
    procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer);
    -- Stores a new edge in the Graph from From to To that has the given
    -- Weight assigned to it. If an edge from From to To is already stored
    -- in the Graph, this function only re-assigns the given Weight to it
    -- and does nothing beyond.
    procedure Clear;
    -- Removes all vertices and edges from the graph.
    function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer;
    -- Returns the weight of the edge, if it is stored in the graph.
    -- Raises an Edge_Not_Found_Exception otherwise.
    function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
    -- Returns True if an edge from From to To is stored in the graph.
    -- Returns False otherwise.
    function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
    -- Removes the edge in the Graph from From to To, if existing; 
    -- Raises an Edge_Not_Found_Exception otherwise.
    function To_Vertex_Array return Vertex_Array;
    -- Returns an array containing exactly all current vertices of the graph.
private
    type Edge_Type is record
        From: Vertex_Type;
        To: Vertex_Type;
        Weight: Integer := 0;
    end record;
    
    package Edge_Vectors is new Ada.Containers.Vectors(
        Element_Type => Edge_Type, 
        Index_Type => Natural);
    package Vertex_Vectors is new Ada.Containers.Vectors(
        Element_Type => Vertex_Type, 
        Index_Type => Natural);
    use Edge_Vectors;
    use Vertex_Vectors;
    
    Edges: Edge_Vectors.Vector;
    Vertices: Vertex_Vectors.Vector;

end Graph;