generic
    type Item_Type is private;
    with function "="(Left: Item_Type; Right: Item_Type) return Boolean;
    with function "<"(Left: Item_Type; Right: Item_Type) return Boolean is <>;
package Parallel_Sort is
    
    type Array_Type is array(Natural range <>) of Item_Type;
    type Array_Access_Type is access all Array_Type;

    Procedure Swap(a, b: in out Natural);

    function Binary_Search(Elem: Item_Type; A: Array_Access_Type; Left, Right: Natural) return Natural;
    procedure Merge_Sort(A, B: Array_Access_Type; Left: Natural; Right: Natural);
    procedure Merge(A, B: Array_Access_Type; Ii, Ji, Ki, Li, P, Q: Natural);

    procedure Parallel_Merge_Sort(Input: Array_Access_Type;
                                  Result: Array_Access_Type);

end Parallel_Sort;