Program LAB11;

{$APPTYPE CONSOLE}

Var
  Str: String;
  Sign: Boolean;
  J: Integer;

Procedure Check(Const S: String; Const I: Integer; Var Flag: Boolean);
Const
  Digits = ['0'..'9'];
Var
  RecCall: Boolean;
begin
  RecCall := true;

  if S[I] in Digits then
    Flag := true
  else
  begin
    if (not Flag) or (I = length(S)) then
    begin
      RecCall := false;
      writeln('Incorrect input in ',I,' position');
    end;

    Flag := false;

    if (S[I] <> '+') and (S[I] <> '-') and (RecCall) then
    begin
      RecCall := false;
      writeln('Incorrect input in ',I,' position');
    end;
  end;

  if RecCall and (I < length(S)) then
    Check(S,I + 1,Flag);

  if (I = length(S)) and RecCall then
    writeln('Everything is fine');
end;

Begin
  J := 1;
  Sign := false;
  writeln('Enter expression');
  readln(Str);

  Check(Str,J,Sign);

  readln;
end.
