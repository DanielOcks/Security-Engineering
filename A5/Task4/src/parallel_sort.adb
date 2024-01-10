package body Parallel_Sort is

    Procedure Swap(a, b: in out Natural) is
        Temp : Natural;
    begin
        Temp:=A; A:=B; B:=Temp;
    end;

    -- I really don't like binary search
    function Binary_Search(Elem: Item_Type; A: Array_Access_Type; Left, Right: Natural) return Natural is
        L : Natural := Left;
        R : Natural := Right;
        M : Natural;
    begin
        while L /= R loop
            M := L + (R-L)/2;
            if M <= A'Last and then (A(M) < Elem or A(M) = Elem) then
                L := M+1;
            elsif M >= A'First then
                R := M;
            else
                exit;
            end if;
        end loop;
        return L;
    end;

    procedure Merge_Sort(A, B: Array_Access_Type; Left: Natural; Right: Natural) is
        Mid : constant Natural := Left + (Right-Left) / 2;
    begin
        if Right-Left <= 1 then 
            return;
        end if;
        declare
            task Sort_Task is
                entry Merge_S;
            end Sort_Task;
            task body Sort_Task is
            begin
                loop
                    select
                        accept Merge_S;
                        Merge_Sort(B, A, Left, Mid);
                    or
                        terminate;
                    end select;
                end loop;
            end Sort_Task;
        begin
            Sort_Task.Merge_S;
            --  Merge_Sort(B, A, Left, Mid);
            Merge_Sort(B, A, Mid, Right);
        end;
        Merge(A, B, Left, Mid, Mid, Right, Left, Right);
    end Merge_Sort;
    
    -- parallel merge as in https://en.wikipedia.org/wiki/Merge_algorithm#Parallel_merge
    -- adapted for use here
    procedure Merge(A, B: Array_Access_Type; Ii, Ji, Ki, Li, P, Q: Natural) is
        I : Natural := Ii;
        J : Natural := Ji;
        K : Natural := Ki;
        L : Natural := Li;
        M : Natural := J-I;
        N : Natural := L-K;
        R : Natural;
        S : Natural;
        T : Natural;
    begin
        if M < N then
            Swap(I, K);
            Swap(J, L);
            Swap(M, N);
        end if;

        if M <= 0 then
            return; -- base case
        end if;

        R := I + (J-I)/2;
        S := Binary_Search(A(R), A, K, L);
        T := P + (R - I) + (S - K);
        B(T) := A(R);
        declare
            task Merge_Task is
                entry Merge_S;
            end Merge_Task;
            task body Merge_Task is
            begin
                loop
                    select
                        accept Merge_S;
                        Merge(A, B, I, R, K, S, P, T);
                    or
                        terminate;
                    end select;
                end loop;
            end Merge_Task;
        begin
            Merge_Task.Merge_S;
            --  Merge(A, B, I, R, K, S, P, T);
            Merge(A, B, R+1, J, S, L, T+1, Q);
        end;

    end Merge;

    -- Implementing Top-down variant as seen on wikipedia
    procedure Parallel_Merge_Sort(Input: Array_Access_Type; Result: Array_Access_Type) is
    Work : constant Array_Access_Type := new Array_Type (Input'First .. Input'Last);
    begin
        for I in Input'First .. Input'Last loop
            Result.all(I) := Input.all(I);
            Work.all(I) := Input.all(I);
        end loop;
        Merge_Sort(Work, Result, Input'First, Input'Last+1);
    end Parallel_Merge_Sort;

end Parallel_Sort;