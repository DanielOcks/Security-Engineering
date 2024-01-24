with Ada.Text_IO; use Ada.Text_IO;
with Interfaces; use Interfaces;
with Mini_XTEA; use Mini_XTEA;
with MITM; use MITM;

procedure t2_mitm is
    Plaintexts : constant State_Array_Type := ((16#53616665#, 16#20616e64#), (16#53656375#, 16#72652020#), (16#536f6674#, 16#77617265#));
    Ciphertexts : constant State_Array_Type := ((16#328cebe1#, 16#b84934dc#), (16#328cebe1#, 16#b84934dc#), (16#39943672#, 16#c3db80ec#));
    Key : Key_Type;
    Has_Found_Key : Boolean := False;

    package MIO is new Ada.Text_IO.Modular_IO(Unsigned_32);
begin
    -- This will find the solution given enough space and time
    -- I have neither
    -- might also just crash because of some ada memory constraint
    Run_MITM(Plaintexts, Ciphertexts, Key, Has_Found_Key);
    if Has_Found_Key then
        Put("Key is: ");
        MIO.Put(Key(0), Base=>16);
        MIO.Put(Key(1), Base=>16);
        New_Line;
    else
        Put_Line("No Key found");
    end if;
end t2_mitm;
