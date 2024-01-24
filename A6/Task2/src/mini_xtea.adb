package body Mini_XTEA is

function Decrypt(Ciphertext: State_Type; Key: Key_Type) return State_Type is
    D2 : constant State_Type := Decrypt_Second_Half(Ciphertext, Key(1));
    V0 : Word_Type := D2(Left);
    V1 : Word_Type := D2(Right);
    Sum : Unsigned_32 := Word_Type(NUM_ROUNDS)/4 * DELTA_CONSTANT;
begin 

    For J in 1..NUM_ROUNDS/4 loop
        V1 := V1 - (((Shift_Left(V0, 4) xor Shift_Right(V0, 5)) + V0) xor (Sum + Key(0)));
        Sum := Sum - DELTA_CONSTANT;
        V0 := V0 - (((Shift_Left(V1, 4) xor Shift_Right(V1, 5)) + V1) xor (Sum + Key(0)));
    end loop;

    return (V0, V1);
end Decrypt;

function Decrypt_Second_Half(Ciphertext: State_Type; Key: Word_Type) return State_Type is
    V0 : Word_Type := Ciphertext(Left);
    V1 : Word_Type := Ciphertext(Right);
    Sum : Unsigned_32 := Word_Type(NUM_ROUNDS)/2 * DELTA_CONSTANT;
begin 

    For J in 1..NUM_ROUNDS/4 loop
        V1 := V1 - (((Shift_Left(V0, 4) xor Shift_Right(V0, 5)) + V0) xor (Sum + Key));
        Sum := Sum - DELTA_CONSTANT;
        V0 := V0 - (((Shift_Left(V1, 4) xor Shift_Right(V1, 5)) + V1) xor (Sum + Key));
    end loop;

    return (V0, V1);
end Decrypt_Second_Half;

function Encrypt(Plaintext: State_Type; Key: Key_Type) return State_Type is
    E1 : constant State_Type := Encrypt_First_Half(Plaintext, Key(0));
    V0 : Word_Type := E1(Left);
    V1 : Word_Type := E1(Right);
    Sum : Unsigned_32 := 16 * DELTA_CONSTANT;
begin 

    For J in 1..NUM_ROUNDS/4 loop
        V0 := V0 + (((Shift_Left(V1, 4) xor Shift_Right(V1, 5)) + V1) xor (Sum + Key(1)));
        Sum := Sum + DELTA_CONSTANT;
        V1 := V1 + (((Shift_Left(V0, 4) xor Shift_Right(V0, 5)) + V0) xor (Sum + Key(1)));
    end loop;

    return (V0, V1);
end Encrypt;

function Encrypt_First_Half(Plaintext: State_Type; Key: Word_Type) return State_Type is
    V0 : Word_Type := Plaintext(Left);
    V1 : Word_Type := Plaintext(Right);
    Sum : Unsigned_32 := 0;
begin 

    For J in 1..NUM_ROUNDS/4 loop
        V0 := V0 + (((Shift_Left(V1, 4) xor Shift_Right(V1, 5)) + V1) xor (Sum + Key));
        Sum := Sum + DELTA_CONSTANT;
        V1 := V1 + (((Shift_Left(V0, 4) xor Shift_Right(V0, 5)) + V0) xor (Sum + Key));
    end loop;

    return (V0, V1);
end Encrypt_First_Half;

end Mini_XTEA;