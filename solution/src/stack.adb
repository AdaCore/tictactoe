package body Stack
with SPARK_Mode => On
is

   Tab  : array (1 .. Max_Size) of Board := (others => (others => (others => Empty)));
   --  The stack. We push and pop pointers to Values.

   -----------
   -- Clear --
   -----------

   procedure Clear is
   begin
      Last := Tab'First - 1;
   end Clear;

   ----------
   -- Push --
   ----------

   procedure Push (V : Board) is
   begin
      Last := Last + 1;
      Tab (Last) := V;
   end Push;

   ---------
   -- Pop --
   ---------

   procedure Pop (V : out Board) is
   begin
      V := Tab (Last);
      Last := Last - 1;
   end Pop;

   ---------
   -- Top --
   ---------

   function Top return Board is
   begin
      return Tab (Last);
   end Top;

end Stack;
