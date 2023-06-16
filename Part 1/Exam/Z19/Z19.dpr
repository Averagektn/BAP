Program Z19;

{$APPTYPE CONSOLE}

Var
  Input:string;
  Words:array [1..255] of string;
  I,N,Max:integer;
  Flag:boolean;

begin

  writeln('Enter words');
  readln(Input);

  N:=1;
  Input:=Input+' ';

  while length(Input)<>0 do
  begin
    if Input[1]=' ' then
      delete(Input,1,1)
    else
    begin
      Words[N]:=copy(Input,1,pos(' ',Input)-1);
      delete(Input,1,pos(' ',Input)-1);
      Inc(N);
    end;
  end;

  Max:=1;

  for I:=2 to N-1 do
    if length(Words[Max])<length(Words[I]) then
    begin
      Max:=I;
    end;

  writeln(Words[Max]);

  readln;
end.
