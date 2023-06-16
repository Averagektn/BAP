Program Z9;

{$APPTYPE CONSOLE}

Const
  N = 5;

Var
  Letters,Words:string;
  Sum:array [1..N] of integer;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min,Max,Temp,NOK,NOD,Num1,Num2:integer;
  Flag:boolean;

begin

  writeln('Enter the first number');
  readln(Num1);
  writeln('Enter the second number');
  readln(Num2);

  I:=2;
  NOK:=Num1;

  while NOK mod Num2 <> 0 do
  begin
    NOK:=Num1*I;
    Inc(I);
  end;

  writeln('NOK: ',NOK);

  NOD:=Num1*Num2 div NOK;

  writeln('NOD: ',NOD);

  I:=2;

  write(Num1,' = 1');

  while Num1<>1 do
    if Num1 mod I=0 then
    begin
      write('*',I);
      Num1:=Num1 div I;
    end
    else
      Inc(I);

  writeln;

  I:=2;

  write(Num2,' = 1');

  while Num2<>1 do
    if Num2 mod I=0 then
    begin
      write('*',I);
      Num2:=Num2 div I;
    end
    else
      Inc(I);

  readln;
end.

