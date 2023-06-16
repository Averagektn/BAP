Program Z25;

{$APPTYPE CONSOLE}

Const
  N=10;
  ValidSymbols=['a'..'z','A'..'Z','_'];
  Numbers=['0'..'9'];

Var
  Id:string;
  Arr:array [1..N,1..N] of integer;
  Num,Sum,I,J:integer;
  Flag:boolean;

begin

  writeln('Enter the number');
  readln(Num);

  Sum:=0;

  while Num>0 do
  begin
    I:=Num mod 10;
    if not odd(I) then
      Sum:=Sum+I;
    Num:=Num div 10;
  end;

  writeln(Sum);

  readln;
end.


