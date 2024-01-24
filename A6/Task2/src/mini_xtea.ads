with Interfaces;

use Interfaces;

package Mini_XTEA is
    subtype Word_Type is Unsigned_32;

    type Side             is (Left, Right);
    type Key_Type         is array(0..1) of Word_Type;
    type State_Type       is array(Side'Range) of Word_Type;
    type State_Array_Type is array(Unsigned_32 range <>) of State_Type;
    type State_Array_Access_Type is not null access all State_Array_Type;

    NUM_ROUNDS:     constant Positive  := 64;
    DELTA_CONSTANT: constant Word_Type := 16#9E3779B9#;
    
    function Decrypt(Ciphertext: State_Type; Key: Key_Type) return State_Type;
    function Decrypt_Second_Half(Ciphertext: State_Type; Key: Word_Type) 
        return State_Type;

    function Encrypt(Plaintext: State_Type; Key: Key_Type) return State_Type;
    function Encrypt_First_Half(Plaintext: State_Type; Key: Word_Type) 
        return State_Type;
end Mini_XTEA;