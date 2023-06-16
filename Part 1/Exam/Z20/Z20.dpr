Program Z20;

{$APPTYPE CONSOLE}

Var
  Numbers,Letters,Convertion:string;
  I:integer;
  ValidLetters:set of char = ['A'..'Z'];


begin

  writeln('Enter letters');
  readln(Letters);

  for I := 1 to length(Letters) do
  begin
    Letters[I]:=UpCase(Letters[I]);
    if Letters[I] in ValidLetters then
    begin
      Str(ord(Letters[I]) - ord('A') + 1, Convertion);
      Numbers := Numbers + Convertion;
    end
    else
      writeln(Letters[I],' is incorrect symbol');
  end;

  writeln('Numbers: ',Numbers);

  readln;
end.

