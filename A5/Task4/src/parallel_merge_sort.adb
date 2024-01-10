with Int_Sort;

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;



procedure Parallel_Merge_Sort is

    procedure Usage is
    begin
        Ada.Text_IO.Put_Line("Usage: -i <in_file_path> -o <out_file_path> -t <max_time> (in seconds)");
    end Usage;

    package TIO renames Ada.Text_IO;
    Package ITIO renames Ada.Integer_Text_IO;

    package Integer_Vectors is new
     Ada.Containers.Vectors
       (Index_Type   => Natural,
        Element_Type => Integer);

    In_File : TIO.File_Type;
    Out_File : TIO.File_Type;
    In_Nums : Integer_Vectors.Vector;
begin
    if Argument_Count /= 6 then
        Usage;
        return;
    end if;

    if Argument(1) /= "-i" or else Argument(3) /= "-o" or else Argument(5) /= "-t" then
        Usage;
        return;
    end if;

    declare
        -- assuming correct input
        In_File_Name : constant String := Argument(2);
        Out_File_Name : constant String := Argument(4);
        Timeout : constant Duration := Duration'Value(Argument(6));
    begin
        -- file existence check (in and out)
        begin
            TIO.Open(In_File, TIO.In_File, In_File_Name);
        exception 
            when TIO.Name_Error =>
                Usage;
                return;
        end;
        begin
            -- should error out when it exists
            -- we should do nothing if it does
            TIO.Open(Out_File, TIO.Append_File, Out_File_Name); 
            Usage;
            return;
        exception
            when others => 
                null;
        end;

        declare
            task Timeout_T is
                entry Done;
            end Timeout_T;
            task body Timeout_T is
            begin
                loop
                    select
                        accept Done;
                        exit;
                    or
                        delay timeout;
                        -- should timeout hopefully
                        TIO.Put_Line("Timeout");
                        raise Program_Error with "Timeout";
                    end select;
                end loop;
            end Timeout_T;
            task Quit_T is
                entry Done;
            end Quit_T;
            task body Quit_T is
                C : Character;
                A : Boolean; -- required to keep looping
            begin
                loop
                    select
                        accept Done;
                        exit;
                    else
                        TIO.Get_Immediate(C, A);
                        if C = 'q' then
                            TIO.Put_Line("Quitting");
                            raise Program_Error with "Quit";
                        end if;
                    end select;
                end loop;
            end;
        begin
            while not TIO.End_Of_File(In_File) loop
                declare
                    Int : constant Integer := Integer'Value(TIO.Get_Line(In_File));
                begin
                    In_Nums.Append(Int);
                end;
            end loop;

            declare
                unsorted : aliased Int_Sort.Array_Type := (0 .. Natural(In_Nums.Length-1) => 0);
                sorted : aliased Int_Sort.Array_Type := (0 .. Natural(In_Nums.Length-1) => 0);
            begin
                for I in unsorted'Range loop
                    unsorted(I) := In_Nums.Element(I);
                end loop;

                Int_Sort.Parallel_Merge_Sort(unsorted'Unchecked_Access, sorted'Unchecked_Access);

                Timeout_T.Done;
                Quit_T.Done;

                -- should not exist at this point (checked further up)
                TIO.Create(Out_File, TIO.Out_File, Out_File_Name);
                for I in sorted'Range loop
                    ITIO.Put(Out_File, sorted(I), Width => 0);
                    TIO.New_Line(Out_File);
                end loop;
                TIO.Close(Out_File);
            end;
            exception
                -- should realisticly only happen on early exit
                when Tasking_Error =>
                    return;
        end;
    end;
end Parallel_Merge_Sort;