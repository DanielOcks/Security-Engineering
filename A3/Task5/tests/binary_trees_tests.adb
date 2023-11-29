with AUnit.Assertions; use AUnit.Assertions;

with Ada.Text_IO;

package body Binary_Trees_Tests is

   procedure Put_Item (x : Natural) is
   begin
      Ada.Text_IO.Put(x'Image);
   end Put_Item;

   procedure Set_Up (T : in out Test) is
   begin
      T.Tree := Null;
   end Set_Up;

   procedure Test_Add_Exc is
   Temp : BT.Binary_Tree_Access;
   begin
      Temp := BT.Create(5);
      BT.Add_Item(Temp, 3);
      BT.Add_Item(Temp, 4);
      BT.Add_Item(Temp, 7);
      BT.Add_Item(Temp, 2);
      BT.Add_Item(Temp, 5); -- raises Item_Already_In_Tree_Exception
   end Test_Add_Exc;

   procedure Test_Rem_Exc is
   Temp : BT.Binary_Tree_Access;
   begin
      Temp := BT.Create(5);
      BT.Add_Item(Temp, 3);
      BT.Add_Item(Temp, 4);
      BT.Add_Item(Temp, 7);
      BT.Add_Item(Temp, 2);
      BT.Remove_Item(Temp, 5);
      BT.Remove_Item(Temp, 4);
      BT.Remove_Item(Temp, 7);
      BT.Remove_Item(Temp, 15); -- raises Item_Not_Found_Exception
   end Test_Rem_Exc;

   procedure Test_Create (T : in out Test) is
   begin
      T.Tree := BT.Create (5);
      Ada.Text_IO.Put_Line("Inorder of Tree should be: 5");
      Ada.Text_IO.Put     ("                       is:");
      BT.Put(T.Tree);
      Ada.Text_IO.New_Line;
      Assert(BT.Get_Height(T.Tree) = 1,
              "Wrong Height after Creation | Should be: 1" & " is: " & BT.Get_Height(T.Tree)'Image);
      Assert(BT.Get_Num_Leaves(T.Tree) = 1,
              "Wrong Num Leaves after Creation | Should be: 1" & " is: " & BT.Get_Num_Leaves(T.Tree)'Image);
   end Test_Create;

   procedure Test_Add (T : in out Test) is
   begin
      T.Tree := BT.Create(5);
      BT.Add_Item(T.Tree, 2);
      BT.Add_Item(T.Tree, 1);
      BT.Add_Item(T.Tree, 6);
      BT.Add_Item(T.Tree, 4);
      BT.Add_Item(T.Tree, 7);
      BT.Add_Item(T.Tree, 3);
      BT.Add_Item(T.Tree, 9);
      BT.Add_Item(T.Tree, 8);
      Ada.Text_IO.Put_Line("Inorder of Tree should be: 1 2 3 4 5 6 7 8 9");
      Ada.Text_IO.Put     ("                       is:");
      BT.Put(T.Tree);
      Ada.Text_IO.New_Line;
      Assert(BT.Get_Height(T.Tree) = 5,
              "Wrong Height after Adding Items | Should be: 5" & " is: " & BT.Get_Height(T.Tree)'Image);
      Assert(BT.Get_Num_Leaves(T.Tree) = 3,
              "Wrong Num Leaves after Adding Items | Should be: 3" & " is: " & BT.Get_Num_Leaves(T.Tree)'Image);
      Assert_Exception(Test_Add_Exc'Access, "Adding an Item twice should raise Item_Already_In_Tree_Exception");
   end Test_Add;

   procedure Test_Rem (T : in out Test) is
   begin
      T.Tree := BT.Create(5);
      BT.Add_Item(T.Tree, 2);
      BT.Add_Item(T.Tree, 1);
      BT.Add_Item(T.Tree, 6);
      BT.Add_Item(T.Tree, 4);
      BT.Add_Item(T.Tree, 7);
      BT.Add_Item(T.Tree, 3);
      BT.Add_Item(T.Tree, 9);
      BT.Add_Item(T.Tree, 8);
      BT.Remove_Item(T.Tree, 4);
      BT.Remove_Item(T.Tree, 3);
      BT.Remove_Item(T.Tree, 7);
      BT.Remove_Item(T.Tree, 5);
      Ada.Text_IO.Put_Line("Inorder of Tree should be: 1 2 6 8 9");
      Ada.Text_IO.Put     ("                       is:");
      BT.Put(T.Tree);
      Ada.Text_IO.New_Line;
      Assert(BT.Get_Height(T.Tree) = 3,
              "Wrong Height after Removing Items | Should be: 3" & " is: " & BT.Get_Height(T.Tree)'Image);
      Assert(BT.Get_Num_Leaves(T.Tree) = 2,
              "Wrong Num Leaves after Removing Items | Should be: 2" & " is: " & BT.Get_Num_Leaves(T.Tree)'Image);
      
      Assert_Exception(Test_Rem_Exc'Access, "Removing a non existing Item should raise Item_Not_Found_Exception");
   end Test_Rem;

   procedure Test_RemAll (T : in out Test) is
   begin
      T.Tree := BT.Create(5);
      BT.Add_Item(T.Tree, 2);
      BT.Add_Item(T.Tree, 1);
      BT.Add_Item(T.Tree, 6);
      BT.Add_Item(T.Tree, 4);
      BT.Add_Item(T.Tree, 7);
      BT.Add_Item(T.Tree, 3);
      BT.Add_Item(T.Tree, 9);
      BT.Add_Item(T.Tree, 8);
      BT.Remove_All(T.Tree);
      Assert(BT.Get_Height(T.Tree) = 0,
              "Wrong Height after Removing All | Should be: 0" & " is: " & BT.Get_Height(T.Tree)'Image);
      Assert(BT.Get_Num_Leaves(T.Tree) = 0,
              "Wrong Num Leaves after Removing All | Should be: 0" & " is: " & BT.Get_Num_Leaves(T.Tree)'Image);
   
   end Test_RemAll;

end Binary_Trees_Tests;
