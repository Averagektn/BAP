Program Lab7;

{$APPTYPE CONSOLE}

{$R *.res}

Uses
  SysUtils,Windows;

Type
  TS = String[255];
  TSet = Set of Char;
  TArr = Array of TS;

Const
  Letters = ['ê','ï','ñ','ò','ô','õ','ö','÷','ø','ù'];

Var
  Str: TS;
  Res: TSet;
  Arr: TArr;

Procedure Input(Var InStr: TS);
Const
  ValidLetters = ['à'..'ÿ'];
Var
  I: Integer;
  Flag: Boolean;
begin
  repeat
    Flag := true;
    writeln('Enter string');
    readln(InStr);

    for I := 1 to length(InStr) - 1 do
      if (InStr[I] in ValidLetters) or (InStr[I] = ',') then
      begin
        if (InStr[I] = ',') and (InStr[I + 1] = ',') then
        begin
          Flag := false;
          writeln(I,' and ',I + 1,' are both commas');
        end
      end
      else
      begin
        Flag := false;
        writeln('Incorrect input in ',I,' letter');
      end;

    if InStr[length(InStr)] <> '.' then
    begin
      Flag := false;
      writeln('No dot in the end of the string');
    end;

  until Flag;
end;

Procedure MakeArray (Str: TS; Var A: TArr);
Var
  Position,I: Integer;
begin
  I := 0;

  while Str <> '' do
  begin
    setlength(A,I + 1);
    Position := pos(',',Str);

    if Position = 0 then
    begin
      A[I] := Copy(Str,1,length(Str) - 1);
      Str := '';
    end

    else

    begin
      A[I] := Copy(Str,1,Position - 1);
      Delete(Str,1,Position);
    end;

    Inc(I);
  end;

end;

Function Find(Const Consonants: TSet; Const A: TArr): TSet;
Type
  TAS = Array of TSet;
Var
  I,J: Integer;
  SA: TAS;
begin
  setlength(SA,length(A));

  for I := low(A) to high(A) do
    for J := low(A[I]) to high(A[I]) do
      if A[I,J] in Consonants then
        Include(SA[I],A[I,J]);

  I := low(SA) + 2;
  while I < length(SA) do
  begin
    SA[low(SA)] := SA[low(SA)] * SA[I];
    I := I + 2;
  end;

  I := low(SA) + 3;
  while I < length(SA) do
  begin
    SA[low(SA) + 1] := SA[low(SA) + 1] + SA[I];
    I := I + 2;
  end;

  Find := SA[low(SA)] - SA[low(SA) + 1];

end;

Procedure Show(Const St: TSet);
Const
  Ltrs: TS = 'êïñòôõö÷øù';
Var
  I: Integer;
begin
  for I := 1 to length(Ltrs) - 1 do
    if Ltrs[I] in St then
      write(Ltrs[I]);
end;

Begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);

  Input(Str);
  MakeArray(Str,Arr);
  Res := Find(Letters,Arr);
  write('Letters that are in all odd words and aren''t a part of any non-odd word are: ');
  Show(Res);

  readln;
end.
