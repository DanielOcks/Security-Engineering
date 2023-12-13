--  with Ada.Text_IO; use Ada.Text_IO;

package body Murmur_Hash2 is

    procedure Hash ( Message : Byte_Array; Seed : Key_Type; Result : out Hash_Type ) is

    --  The C implementation has problems with the left part due to undefined behaviour (32 bit literal on x86)
    --  warning: left shift count >= width of type
    --  this results in m being just 0x5bd1e995 (1540483477)
    --  the line should be
    --  const uint64_t m = (0xc6a4a793ULL << 32) | 0x5bd1e995ULL; // (ULL instead of just L)
    --  for it to work (at least on gcc)
    --  We use the value that C would use in the given implementation
    --  all our test values are also based on the "wrong" value of M
    --  M : constant Uint64 := 16#c6_a4_a7_93_5b_d1_e9_95#;
    M : constant Uint64 := 16#5b_d1_e9_95#;
    R : constant Natural := 24;

    -- Xoring a single value is easier than doing it per byte
    Uint64Seed : constant Uint64 := Shift_Left(Uint64(Seed(Seed'First  )), 56)
                                   +Shift_Left(Uint64(Seed(Seed'First+1)), 48)
                                   +Shift_Left(Uint64(Seed(Seed'First+2)), 40)
                                   +Shift_Left(Uint64(Seed(Seed'First+3)), 32)
                                   +Shift_Left(Uint64(Seed(Seed'First+4)), 24)
                                   +Shift_Left(Uint64(Seed(Seed'First+5)), 16)
                                   +Shift_Left(Uint64(Seed(Seed'First+6)),  8)
                                   +           Uint64(Seed(Seed'First+7));

    H : Uint64 := Uint64Seed xor Uint64(Message'Length);

    K : Uint64;

    -- We can keep track of the current location with an index
    -- instead of a data pointer
    Ind : Uint64 := Message'First;
    Len : Int64 := Message'Length;

    -- Kept in from debugging
    -- the c implementation was filled with the same prints with the same index
    -- to keep track of changes in values
    --  Count : Natural := 1;

    begin
        -- Put_Line(Count'Image & ": Seed " & Uint64Seed'Image); Count := Count+1;
        -- Put_Line(Count'Image & ": H " & H'Image); Count := Count+1;

        while Len >= 8 loop
            --  we need to manually assign our K by bytes
            K := 0;
            for J in 0..7 loop
                K := K + Shift_Left(Uint64(Message(Ind+Uint64(J))),  8*J);
            end loop;

            -- Put_Line(Count'Image & ": K " & K'Image); Count := Count+1;

            K := K * M; -- Put_Line(Count'Image & ": K " & K'Image); Count := Count+1;
            K := K xor (Shift_Right(K, R)); -- Put_Line(Count'Image & ": K " & K'Image); Count := Count+1;
            K := K * M; -- Put_Line(Count'Image & ": K " & K'Image); Count := Count+1;

            H := H * M;
            -- Put_Line(Count'Image & ": H " & H'Image); Count := Count+1;
            H := H xor K;

            -- Put_Line(Count'Image & ": H " & H'Image); Count := Count+1;

            -- since Ind replaces our data pointer we increment it the same way
            Ind := Ind+8;
            Len := Len-8;
        end loop;

        -- Ada doesn't have fallthrough for case/switch statements so we chain ifs instead
        if Len >= 7 then
            H := H xor Shift_Left(Uint64(Message(Ind+6)), 48);
            -- Put_Line(Count'Image & ": XOR1 " & Message(Ind+6)'Image); Count := Count+1;
        end if;
        if Len >= 6 then
            H := H xor Shift_Left(Uint64(Message(Ind+5)), 40);
            -- Put_Line(Count'Image & ": XOR2 " & Message(Ind+5)'Image); Count := Count+1;
        end if;
        if Len >= 5 then
            H := H xor Shift_Left(Uint64(Message(Ind+4)), 32);
            -- Put_Line(Count'Image & ": XOR3 " & Message(Ind+4)'Image); Count := Count+1;
        end if;
        if Len >= 4 then
            H := H xor Shift_Left(Uint64(Message(Ind+3)), 24);
            -- Put_Line(Count'Image & ": XOR4 " & Message(Ind+3)'Image); Count := Count+1;
        end if;
        if Len >= 3 then
            H := H xor Shift_Left(Uint64(Message(Ind+2)), 16);
            -- Put_Line(Count'Image & ": XOR5 " & Message(Ind+2)'Image); Count := Count+1;
        end if;
        if Len >= 2 then
            H := H xor Shift_Left(Uint64(Message(Ind+1)), 8);
            -- Put_Line(Count'Image & ": XOR6 " & Message(Ind+1)'Image); Count := Count+1;
        end if;
        if Len >= 1 then
            H := H xor Uint64(Message(Ind));
            -- Put_Line(Count'Image & ": XOR7 " & Message(Ind)'Image); Count := Count+1;
            H := H * M;
        end if;

        -- Put_Line(Count'Image & ": H " & H'Image); Count := Count+1;

        H := H xor (Shift_Right(H, 13));
        H := H * M;
        H := H xor (Shift_Right(H, 15));

        -- Put_Line(Count'Image & ": H " & H'Image); Count := Count+1;

        -- to convert our resulting hash H into a Hash_Type we cut off the ends
        -- and place them in reverse order into the Result variable
        -- we move the correct byte into place by shifting H by one byte
        for J in 0..7 loop
            Result(Uint64(7-J)) := Uint8(H mod 256);
            H := Shift_Right(H, 8);
        end loop;

    end Hash;

end Murmur_Hash2;