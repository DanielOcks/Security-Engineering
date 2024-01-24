with Interfaces; use Interfaces;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Indefinite_Ordered_Maps;

package body MITM is

    package Key_Ordered_Map is new Ada.Containers.Indefinite_Ordered_Maps
      (Key_Type        => State_Type,
       Element_Type    => Unsigned_32);

    P1 : Key_Ordered_Map.Map;

procedure Run_MITM(Plaintexts: State_Array_Type; Ciphertexts: State_Array_Type; Key: out Key_Type; Has_Found_Key: out Boolean) is

task type Enc is
    entry Start (ID : in Natural);
end Enc;

task body Enc is
    S, E : Unsigned_32;
begin
    accept Start (ID : in Natural) do
        S := Unsigned_32(ID*(2**30));
        E := Unsigned_32((ID+1)*(2**30)-1);
    end Start;
    --  2^32/4
    for I in S .. E loop
        P1.Include(Encrypt_First_Half(Plaintexts(0), I), I);
    end loop;
end Enc;

begin
    declare
        Workers : array (0..3) of Enc;
    begin
        Workers(0).Start(0);
        Workers(1).Start(1);
        Workers(2).Start(2);
        Workers(3).Start(3);
    end;

    Put_Line("all K0 generated, searching K1");

    for I in Unsigned_32(0) .. Unsigned_32(2**32-1) loop
        declare
            Dec : constant State_Type := Decrypt_Second_Half(Ciphertexts(0), I);
        begin
            if P1.Contains(Dec) then
                Has_Found_Key := True;
                for J in Plaintexts'First .. Plaintexts'Last loop
                    if Encrypt(Plaintexts(J), (P1(Dec), I)) /= Ciphertexts(J) then
                        Has_Found_Key := False;
                    end if;
                end loop;
                if Has_Found_Key then
                    Key := (P1(Dec), I);
                    return;
                end if;
            end if;
        end;
    end loop;
end Run_MITM;

end MITM;