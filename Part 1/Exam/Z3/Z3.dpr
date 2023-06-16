Program Z3;

{$APPTYPE CONSOLE}

Var
  Letters,Numbers,Convert:string;
  I:integer;
  ValidLetters:set of char = ['A'..'Z'];

begin

  writeln('Enter Letters');
  readln(Letters);

  for I:=1 to length(Letters) do
  begin
    Letters[I]:=UpCase(Letters[I]);
    if Letters[I] in ValidLetters then
    begin
      Str(ord(Letters[I])-ord('A')+1,Convert);
      Numbers:=Numbers+Convert;
    end
    else
      writeln(Letters[I],' is incorrect symbol');
  end;

  write('Numbers: ',Numbers);
  readln;
end.

