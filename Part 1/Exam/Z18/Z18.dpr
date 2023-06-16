Program Z18;

{$APPTYPE CONSOLE}

Var
  Letters,Words,Number,Code,Convert,Name,Copy,Input:string;
  StrArr:array [1..255] of string;
  L:char;
  Up,Down,I,J,N,Min,Max,Temp,Error,Num1,Num2:integer;
  Flag,NonEven:boolean;
  BigLetters:set of char = ['A'..'Z'];
  SmallLetters:set of char = ['a'..'z'];

begin

  writeln('Enter number');
  readln(Number);

  N:=0;

  for I:=length(Number) downto 2 do
  begin
    Inc(N);
    if N mod 3 = 0 then
      Insert(' ',Number,I);
  end;

  writeln(Number);



  readln;
end.

