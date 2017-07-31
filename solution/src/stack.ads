with Tictactoe; use Tictactoe;

package Stack
with SPARK_Mode => On
is

   procedure Push (V : Board)
     with Pre => not Full,
     Post => Size = Size'Old + 1;

   procedure Pop (V : out Board)
     with Pre => not Empty,
     Post => Size = Size'Old - 1;

   procedure Clear;

   function Top return Board
   with Pre => not Empty;

   Max_Size : constant := 9;
   --  The stack size.

   Last : Natural range 0 .. Max_Size := 0;
   --  Indicates the top of the stack. When 0 the stack is empty.

   function Full return Boolean is (Last >= Max_Size);

   function Empty return Boolean is (Last < 1);

   function Size return Integer is (Last);

end Stack;
