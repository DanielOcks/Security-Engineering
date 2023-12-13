with Interfaces;

package Murmur_Hash2 is

    type Int64 is new Interfaces.Integer_64;
    type Uint8 is new Interfaces.Unsigned_8;
    type Uint32 is new Interfaces.Unsigned_32;
    type Uint64 is new Interfaces.Unsigned_64;
    type Byte_Array is array ( Uint64 range <>) of Uint8;

    subtype Key_Type is Byte_Array ( Uint64 range 0..7 );
    subtype Hash_Type is Byte_Array ( Uint64 range 0..7 );

    procedure Hash ( Message : Byte_Array;
                     Seed : Key_Type;
                     Result : out Hash_Type );

end Murmur_Hash2;