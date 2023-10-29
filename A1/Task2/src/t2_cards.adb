with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure t2_cards is
   -- Define a record type called Card to represent a single card
   type Suit is (Clubs, Diamonds, Hearts, Spades);
   type Value is (Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King);
   type Card is record
      Card_Suit: Suit;
      Card_Value: Value;
   end record;

   -- Creating a deck of 52 Cards
   type Deck is array(1..52) of Card;

   -- Function to create a deck with 52 different cards
   function Create_Deck return Deck is
      Full_Deck : Deck;
      Index : Integer := 1;
   begin
      for S in Suit loop
         for V in Value loop
            Full_Deck(Index).Card_Suit := S;
            Full_Deck(Index).Card_Value := V;
            Index := Index + 1;
         end loop;
      end loop;
      return Full_Deck;
   end Create_Deck;

   New_Deck : constant Deck := Create_Deck;

   type Random_Range is new Integer range 1..52;
   package Random_Int is new ada.numerics.discrete_random(Random_Range);
   Gen : Random_Int.Generator;
   type Random_Integer_Array is array(1..3) of Random_Range;
   Random_Int_Array : Random_Integer_Array;

   -- function to generate an array with 3 different intergers
   function Generate_Random_Integers return Random_Integer_Array is
      Random_Int_Array : Random_Integer_Array;
      Num1, Num2, Num3 : Random_Range;
   begin
      loop
      Random_Int.reset(Gen);
      Num1 := Random_Int.random(Gen);
      Num2 := Random_Int.random(Gen);
      Num3 := Random_Int.random(Gen);
         if Num1 /= Num2 and Num1 /= Num3 and Num2 /= Num3 then
            Random_Int_Array(1) := Num1;
            Random_Int_Array(2) := Num2;
            Random_Int_Array(3) := Num3;
            return Random_Int_Array;
         end if;
     end loop;
   end Generate_Random_Integers;

begin
   Random_Int_Array := Generate_Random_Integers;
   for I in 1..3 loop
      -- Bonus Ada.Text_IO.Put_Line("Random Number: " & Random_Range'Image(Random_Int_Array(I)));
      Ada.Text_IO.Put_Line("Card Suit: " & Suit'Image(New_Deck(Integer(Random_Int_Array(I))).Card_Suit));
      Ada.Text_IO.Put_Line("Card Value: " & Value'Image(New_Deck(Integer(Random_Int_Array(I))).Card_Value));
      Ada.Text_IO.New_Line;
   end loop;
end t2_cards;
