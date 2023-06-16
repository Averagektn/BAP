Program Z16;

{$APPTYPE CONSOLE}

Const
  N = 10;

Var
  Letters,Words,Number,Code,Convert,Name,Copy:string;
  Sum:array [0..N-1] of integer;
  Arr:array [1..N,1..N] of integer;
  L:char;
  Up,Down,I,J,Min,Max,Temp,Error,Num1,Num2:integer;
  Flag,NonEven:boolean;
  BigLetters:set of char = ['A'..'Z'];
  SmallLetters:set of char = ['a'..'z'];

begin

  writeln('Enter the first number');
  readln(Num1);
  writeln('Enter the second number');
  readln(Num2);

  while Num1<>Num2 do
    if Num1>Num2 then
      Num1:=Num1-Num2
    else
      Num2:=Num2-Num1;

  if Num1 = 1 then
    writeln('No')
  else
    writeln('Yes');

  readln;
end.

