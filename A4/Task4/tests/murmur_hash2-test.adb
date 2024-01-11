with AUnit.Assertions; use AUnit.Assertions;

package body Murmur_Hash2.Test is

   procedure Test_Hashing (T : in out Test) is
      pragma Unreferenced (T);
      M1 : constant Byte_Array := (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
      S1 : constant Key_Type := (0, 0, 0, 0, 0, 0, 0, 0);
      O1 : Hash_Type;

      -- "Wieso implementieren wir eine MurmurHash version die nicht im offizielen repo existiert? Es gibt keine 64-bit version mit r=24, aber da m sowieso die haelfte ignoriert ist es identisch zur standart 32-bit MurmurHash2 version :)"
      -- als byte array
      M2 : constant Byte_Array := (16#57#,16#69#,16#65#,16#73#,16#6f#,16#20#,16#69#,16#6d#,16#70#,16#6c#,16#65#,16#6d#,16#65#,16#6e#,16#74#,16#69#,16#65#,16#72#,16#65#,16#6e#,16#20#,16#77#,16#69#,16#72#,16#20#,16#65#,16#69#,16#6e#,16#65#,16#20#,16#4d#,16#75#,16#72#,16#6d#,16#75#,16#72#,16#48#,16#61#,16#73#,16#68#,16#20#,16#76#,16#65#,16#72#,16#73#,16#69#,16#6f#,16#6e#,16#20#,16#64#,16#69#,16#65#,16#20#,16#6e#,16#69#,16#63#,16#68#,16#74#,16#20#,16#69#,16#6d#,16#20#,16#6f#,16#66#,16#66#,16#69#,16#7a#,16#69#,16#65#,16#6c#,16#65#,16#6e#,16#20#,16#72#,16#65#,16#70#,16#6f#,16#20#,16#65#,16#78#,16#69#,16#73#,16#74#,16#69#,16#65#,16#72#,16#74#,16#3f#,16#20#,16#45#,16#73#,16#20#,16#67#,16#69#,16#62#,16#74#,16#20#,16#6b#,16#65#,16#69#,16#6e#,16#65#,16#20#,16#36#,16#34#,16#2d#,16#62#,16#69#,16#74#,16#20#,16#76#,16#65#,16#72#,16#73#,16#69#,16#6f#,16#6e#,16#20#,16#6d#,16#69#,16#74#,16#20#,16#72#,16#3d#,16#32#,16#34#,16#2c#,16#20#,16#61#,16#62#,16#65#,16#72#,16#20#,16#64#,16#61#,16#20#,16#6d#,16#20#,16#73#,16#6f#,16#77#,16#69#,16#65#,16#73#,16#6f#,16#20#,16#64#,16#69#,16#65#,16#20#,16#68#,16#61#,16#65#,16#6c#,16#66#,16#74#,16#65#,16#20#,16#69#,16#67#,16#6e#,16#6f#,16#72#,16#69#,16#65#,16#72#,16#74#,16#20#,16#69#,16#73#,16#74#,16#20#,16#65#,16#73#,16#20#,16#69#,16#64#,16#65#,16#6e#,16#74#,16#69#,16#73#,16#63#,16#68#,16#20#,16#7a#,16#75#,16#72#,16#20#,16#73#,16#74#,16#61#,16#6e#,16#64#,16#61#,16#72#,16#74#,16#20#,16#33#,16#32#,16#2d#,16#62#,16#69#,16#74#,16#20#,16#4d#,16#75#,16#72#,16#6d#,16#75#,16#72#,16#48#,16#61#,16#73#,16#68#,16#32#,16#20#,16#76#,16#65#,16#72#,16#73#,16#69#,16#6f#,16#6e#,16#20#,16#3a#,16#29#);
      S2 : constant Key_Type := (16#c6#, 16#a4#, 16#a7#, 16#93#, 16#5b#, 16#d1#, 16#e9#, 16#95#);
      O2 : Hash_Type;
   begin
      Hash(M1, S1, O1);
      Assert (O1 = (16#A5#, 
                    16#1C#, 
                    16#B0#, 
                    16#69#, 
                    16#9E#, 
                    16#F9#, 
                    16#55#, 
                    16#AB#), "Hashing result different from C implementation");
   
      Hash(M2, S2, O2);
      Assert (O2 = (16#58#, 
                    16#B7#, 
                    16#81#, 
                    16#1E#, 
                    16#76#, 
                    16#53#, 
                    16#E2#, 
                    16#58#), "Hashing result different from C implementation");
   end Test_Hashing;

end Murmur_Hash2.Test;