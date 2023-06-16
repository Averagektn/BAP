Program Z24;

{$APPTYPE CONSOLE}

Const
  N=10;
  ValidSymbols=['a'..'z','A'..'Z','_'];
  Numbers=['0'..'9'];

Var
  Id:string;
  Arr:array [1..N,1..N] of integer;
  Sum:array[1..N] of integer;
  Num,I,J:integer;
  Flag:boolean;

begin

  writeln('Enter the identifier');
  readln(Id);

  Flag:=false;
  if Id[1] in ValidSymbols then
    Flag:=true;

  for I:=2 to length(Id) do
    if not ((Id[I] in ValidSymbols) or (Id[I] in Numbers)) and Flag then
      Flag:=false;

  if Flag then
    writeln('Yes')
  else
    writeln('No');


  readln;
end.


