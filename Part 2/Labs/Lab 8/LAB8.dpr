Program LAB8;

{$APPTYPE CONSOLE}

Const
  NameF = 'In.txt';
  NameG = 'Out.txt';

Var
  F,G: TextFile;

Procedure Inp(Var InF: TextFile);
Var
  I,J: Integer;
begin
  Randomize;
  Rewrite(InF);

  for I := 0 to 4 do
  begin
    for J := 0 to 49 do
      write(InF,chr(Random(25) + 65));
    writeln(F);
  end;

  CloseFile(InF);
end;

Procedure Outp(Const F: TextFile);
Var
  Str: String;
begin
  Reset(F);
  while not EoF(F) do
  begin
    readln(F,Str);
    writeln(Str);
  end;
  writeln;
end;

Procedure Proc(Const InF: TextFile; Var OutF: TextFile);
Var
  StrIn,StrOut: String;
  I : Integer;
begin
  Reset(InF);
  Rewrite(OutF);

  while not EoF(InF) do
  begin
    StrOut := '';
    readln(InF,StrIn);
    for I := 1 to length(StrIn) do
      StrOut := StrOut + StrIn[length(StrIn) - I + 1];
    writeln(OutF,StrOut);
  end;

  CloseFile(InF);
  CloseFile(OutF);
end;

Begin
  AssignFile(F,NameF);
  AssignFile(G,NameG);

  writeln('File F:');

  Inp(F);
  Outp(F);
  Proc(F,G);

  writeln('File G:');
  Outp(G);
  readln;
end.
