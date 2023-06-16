Program Razminka4_2;

{$APPTYPE CONSOLE}

Var
Result:array of integer;
I,K,Temp,Sum,Check,Error:integer;
Input1,Input2,Save:string;
Flag1,Flag2,FlagSize,Cycle:boolean;

begin
  repeat
    Flag1:=true;
    writeln('Enter minuend');
    readln(Input1);
    I:=0;
    repeat
      I:=I+1;
      val(Input1[I],Check,Error);
      if Error<>0 then
        Flag1:=false;
    until I=length(Input1);
    if Flag1=false then
      writeln('Incorrect data');
  until Flag1=true;

  repeat
    Flag2:=true;
    writeln('Enter subtrahend');
    readln(Input2);
    I:=0;
    repeat
      I:=I+1;
      val(Input2[I],Check,Error);
      if Error<>0 then
        Flag2:=false;
    until I=length(Input2);
    if Flag2=false then
      writeln('Incorrect data');
  until Flag2=true;

  FlagSize:=true;

  if length(Input1)<length(Input2) then
    FlagSize:=false;

  Cycle:=true;

  if length(Input1)=length(Input2) then
  begin
    I:=1;
    while Cycle=true do
    begin
      if Input1[I]<Input2[I] then
      begin
        FlagSize:=false;
        Cycle:=false;
      end;
      if Input1[I]>Input2[I] then
        Cycle:=false;
      I:=I+1;
    end;
  end;

  for I:=length(Input1)+1 to length(Input2) do
    Input1:='0'+Input1;
  for I:=length(Input2)+1 to length(Input1) do
    Input2:='0'+Input2;

  setlength(Result,length(Input1)+1);
  Temp:=0;

  if FlagSize=false then
  begin
    Save:=Input1;
    Input1:=Input2;
    Input2:=Save;
  end;

  for I:=length(Input1)+1 downto 1 do
  begin
    Sum:=ord(Input1[I])-ord(Input2[I])-Temp;
    if (Sum<0) then
    begin
      Sum:=10+Sum;
      Temp:=1;
    end
    else
    Temp:=0;
    Result[I]:=Sum;
  end;

  K:=1;
  repeat
    if Result[K]=0 then
      K:=K+1;
  until (Result[K]<>0) or (K=length(Input1));

  writeln('Result:');
  if FlagSize=false then
    write('-');
  for I:=K to length(Input1) do
    write(Result[I]);

  readln;
end.
