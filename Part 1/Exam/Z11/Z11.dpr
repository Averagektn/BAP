Program Z11;

{$APPTYPE CONSOLE}

Const
  N = 8;

Var
  Letters,Words,Number:string;
  Sum:array [1..N] of integer;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min,Max,Temp,Error:integer;
  Flag,NonEven:boolean;

begin

  writeln('Enter number');
  readln(Number);

  for I:=1 to length(Number) do
  begin
    val(Number[I],J,Error);
    NonEven:=odd(J);
    if not NonEven then
      delete(Number,I,1);
  end;

  writeln(Number);

  readln;
end.

