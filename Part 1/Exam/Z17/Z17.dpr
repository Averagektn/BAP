Program Z17;

{$APPTYPE CONSOLE}

Var
  Input:string;
  Words:array [1..255] of string;
  I,N:integer;
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

  Flag:=true;

  for I:=1 to N-1 do
    if Words[I,1]=Words[I,length(Words[I])] then
    begin
      Flag:=false;
      write(Words[I],' ');
    end;

  if Flag then
    writeln('No words');

  readln;
end.
