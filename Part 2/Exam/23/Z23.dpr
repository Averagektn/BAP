Program Z23;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 5;
  Name = 'file.txt';

Type
  TRec = Record
    Number: String[8];
    Length,Cost: Integer;
  end;

  TArr = Array [1..N] of TRec;

Var
  F: TextFile;
  S: String;
  Arr: TArr;
  I: Integer;

Procedure Find(Const A: TArr);
Var
  Total: Integer;
  R: TRec;
begin
  Total := 0;

  for I := low(A) to high(A) do
    with A[I] do
      if Length * Cost > Total then
      begin
        Total := Length * Cost;
        R := A[I];
      end;

  writeln('The most expensive call: ');
  with R do
  begin
    writeln('Number : ', Number);
    writeln('Call length: ', Length);
    writeln('Call cost: ',Cost);
  end;

end;

Begin
  Randomize;

  AssignFile(F,Name);
  Rewrite(F);

  for I := 1 to N do
  begin
    S := IntToStr(Random(1000000));
    writeln(S);
    writeln(F,S);
    writeln(F,Random(50));
    writeln(F,Random(300));
  end;
  CloseFile(F);

  Reset(F);


  for I := low(Arr) to high(Arr) do
    with Arr[I] do
    begin
      readln(F,Number);
      readln(F,Length);
      readln(F,Cost);
    end;
  CloseFile(F);
  Find(Arr);

  //writeln(Arr[1].Number);

  //writeln(Rec.Number);

  readln;
end.
