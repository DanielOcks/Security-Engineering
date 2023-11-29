package body Binary_Trees is

    procedure Add_Item(T: in Binary_Tree_Access; Item: Item_Type) is
	begin
        -- this should only happen when T is empty
        -- T can only be empty if it doesn't exist
        -- therefore you can't add items to it
        -- and this should never happen
        if T = Null then 
            raise Program_Error;
        end if;

        -- this is a bit inefficient if it's not in the Tree
        if Has_Item(T, Item) then
            raise Item_Already_In_Tree_Exception;
        end if;

        if Item < T.Item then
            if T.Left = Null then
                T.Left := Create(Item);
                T.Left.Parent := T;
            else 
                Add_Item(T.Left, Item);
            end if;
        else
            if T.Right = Null then
                T.Right := Create(Item);
                T.Right.Parent := T;
            else 
                Add_Item(T.Right, Item);
            end if;
        end if;
	end Add_Item;
    
    function Create(Item: Item_Type) return Binary_Tree_Access is
        Tree : constant Binary_Tree_Access := new Binary_Tree'(Item, Null, Null, Null);
    begin
        return Tree;
	end Create;
    
    function Has_Children(T: Binary_Tree_Access) return Boolean is
	begin
        If T.Left /= Null or else T.Right /= Null then
            return True;
        end if;
        return False;
	end Has_Children;
    
    function Has_Item(T: Binary_Tree_Access; Item: Item_Type) return Boolean is
	begin
        if T = Null then 
            return False;
        end if;

        if Item = T.Item then
            return True;
        end if;

        if Item < T.Item then
            return Has_Item(T.Left, Item);
        else
            return Has_Item(T.Right, Item);
        end if;
	end Has_Item;
    
    function Get_Height(T: Binary_Tree_Access) return Natural is
        L_Height : Natural := 0;
        R_Height : Natural := 0;
	begin
        if T = Null then
            return 0;
        end if;
        
        L_Height := Get_Height(T.Left);
        R_Height := Get_Height(T.Right);
        
        return Natural'Max(L_Height, R_Height) + 1;
	end Get_Height;
    
    function Get_Num_Leaves(T: Binary_Tree_Access) return Natural is
        L_Children : Natural := 0;
        R_Children : Natural := 0;
    begin
        if T = Null then
            return 0;
        end if;
        
        if not Has_Children(T) then
            return 1;
        end if;
        
        L_Children := Get_Num_Leaves(T.Left);
        R_Children := Get_Num_Leaves(T.Right);
        
        return L_Children + R_Children;
    end Get_Num_Leaves;
    
    procedure Put(T: Binary_Tree_Access) is
	begin
        if T = Null then
            return;
        end if;

        Put(T.Left);
        Put_Item(T.Item);
        Put(T.Right);
	end Put;
    
    procedure Remove_Item(T: in out Binary_Tree_Access; Item: Item_Type) is
        Temp : aliased Binary_Tree_Access := Null;
        TempParent : aliased Binary_Tree_Access := Null;
	begin
        if not Has_Item(T, Item) then
            raise Item_Not_Found_Exception;
        end if;

        if Item = T.Item then
            if T.Left /= Null and T.Right /= Null then
                --  find next inorder, swap, then free
                TempParent := T;
                Temp := T.Right;
                while Temp.Left /= Null loop
                    TempParent := Temp;
                    Temp := Temp.Left;
                end loop;

                if TempParent /= T then 
                    TempParent.Left := Temp.Right;
                else
                    TempParent.Right := Temp.Right;
                end if;
                
                T.Item := Temp.Item;
                Free(Temp);
            elsif T.Left /= Null then
                --  replace left, then free
                Temp := T;
                T := T.Left;
                T.Parent := Temp.Parent;
                Free(Temp);
            elsif T.Right /= Null then
                --  replace right, then free
                Temp := T;
                T := T.Right;
                T.Parent := Temp.Parent;
                Free(Temp);
            else
                --  just remove
                Free(T);
            end if;
            return;
        end if;

        if Item < T.Item then
            Remove_Item(T.Left, Item);
        else
            Remove_Item(T.Right, Item);
        end if;

	end Remove_Item;
    
    procedure Remove_All(T: in out Binary_Tree_Access) is
	begin
        while T /= Null loop
            Remove_Item(T, T.Item);
        end loop;
	end Remove_All;

end Binary_Trees;