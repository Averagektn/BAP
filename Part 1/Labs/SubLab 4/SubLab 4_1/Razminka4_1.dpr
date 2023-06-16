Program Razminka4_1;

{$APPTYPE CONSOLE}

Var
Result:array of integer;
I,Temp,Sum,Check,Error:integer;
Input1,Input2:string;
Flag1,Flag2:boolean;

begin
  repeat
    Flag1:=true;
    writeln('Enter the first term');
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
    writeln('Enter the second term');
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

  for I:=length(Input1)+1 to length(Input2) do
    Input1:='0'+Input1;
  for I:=length(Input2)+1 to length(Input1) do
    Input2:='0'+Input2;

  setlength(Result,length(Input1)+1);

  for I:=length(Input1) downto 1 do
  begin
    Sum:=Temp+ord(Input1[I])-ord('0')+ord(Input2[I])-ord('0');
    Result[I]:=Sum mod 10;
    Temp:=Sum div 10;
  end;
  if Temp<>0 then
    Result[length(Input1)+1]:=Temp
  else
    Result[length(Input1)+1]:=0;

  writeln('Result:');
  if Result[length(Input1)+1]<>0 then
    write(Result[length(Input1)+1]);
  for I:=1 to length(Input1) do
    write(Result[I]);
    
  readln;
end.

