Program Z28;

{$APPTYPE CONSOLE}

Const
  N=10;
  ValidSymbols=['a'..'z','A'..'Z','_'];
  Numbers=['0'..'9'];

Var
  ID:string;
  Arr:array [1..N,1..N] of integer;
  Num,Sum,I,J:integer;
  Flag:boolean;

begin

  writeln('Enter the string');
  readln(ID);

  if ID[1]<>' ' then
    ID[1]:=Upcase(ID[1]);

  for I:=2 to length(ID)-1 do
    if (ID[I]=' ') and (ID[I+1]<>' ') then
      ID[I+1]:=UpCase(ID[I+1]);


  writeln(ID);

  readln;
end.


