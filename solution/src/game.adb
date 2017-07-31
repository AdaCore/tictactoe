with Tictactoe; use Tictactoe;
with Ada.Text_IO; use Ada.Text_IO;
with Stack; use Stack;

procedure Game
  with SPARK_Mode => On
is
   Player_Turn : Boolean := True;
begin
   Initialize; -- bug, forget the initialization?

   while not Is_Full -- bug, forget is full should kill the is_free proof?
     and then Won = Empty -- bug = or else => and then
   loop
      if Player_Turn then
         Put_Line ("Player");

         declare
            S : String := Get_Line;
         begin
            if S = "u" then
               if Size > 0 then
                  Stack.Pop(My_Board);
               end if;

               Display;
            else
               pragma Assume (Size < 9);
               Stack.Push(My_Board);
               Player_Play(S);
               Player_Turn := not Player_Turn;
               Display;
            end if;
         end;
      else
         Put_Line ("Computer");
         Computer_Play;
         Player_Turn := not Player_Turn;
         Display;
      end if;
   end loop;

   case Won is
      when Computer =>
         Put_Line ("Really, losing against tic tac toe???");
      when Player =>
         Put_Line ("Will try using a deep learning algorithm next time...");
      when Empty =>
         Put_Line ("What's the other kind?");
   end case;
end Game;
