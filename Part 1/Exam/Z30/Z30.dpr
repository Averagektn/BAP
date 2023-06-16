Program Z31;

{$APPTYPE CONSOLE}

Const
  N=50;

Var
  ID:string;
  Arr:array [1..N] of integer;
  Num,Sum,Temp,I,J,Counter,CCounter,Ctemp:integer;
  Flag:boolean;

begin

  Randomize;
  for I:=1 to N do
    Arr[I]:=Random(10);

  for I:=1 to N do
    write(Arr[I]:3);

  Temp:=1;
  CTemp:=1;
  Counter:=1;
  CCounter:=1;

  for I:=2 to N do
    if Arr[I]<=Arr[I-1] then
      Counter:=Counter+1
    else
    begin
      if Counter>CCounter then
      begin
        CCounter:=Counter;
        CTemp:=Temp;
      end;
      Counter:=1;
      Temp:=I;
    end;

    if Counter>CCounter then
    begin
      CCounter:=Counter;
      CTemp:=Temp;
    end;

    writeln;
    writeln('Max length: ',CCounter,'. Index: ',CTemp);

  readln;
end.


