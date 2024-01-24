with Mini_XTEA; use Mini_XTEA;

package MITM is
    procedure Run_MITM(Plaintexts:    State_Array_Type; 
                       Ciphertexts:   State_Array_Type;
                       Key:           out Key_Type; 
                       Has_Found_Key: out Boolean);
end MITM;