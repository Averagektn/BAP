Program Z21;

{$APPTYPE CONSOLE}

Type
  TDay=1..31;
  TMonth=1..12;
  TNumber=1..366;

Var
  Numbers,Letters,Convertion:string;
  Days:array [1..12] of integer = (31,28,31,30,31,30,31,31,30,31,30,31);
  I,Y:integer;
  M:TMonth;
  D:TDay;
  Num:TNumber;
  ValidLetters:set of char = ['A'..'Z'];
  FlagYear,InputYear,InputMonth,InputDay:boolean;


begin

  repeat
    InputYear:=true;
    writeln('Enter year');
    readln(Y);
    if Y<=0 then
    begin
      writeln('Incorrect data');
      InputYear:=false;
    end;
  until InputYear;

  FlagYear:=false;
  if (Y mod 4 = 0) and ((Y mod 100 <> 0) or (Y mod 400 = 0)) then
    FlagYear:=true;

  repeat
    InputMonth:=true;
    writeln('Enter month');
    readln(M);
    if (M<=0) or (M>12) then
    begin
      writeln('Incorrect data');
      InputMonth:=false;
    end;
  until InputMonth;

  repeat
    InputDay:=true;
    writeln('Enter day');
    readln(D);
    Case M of
    1,3,5,7,8,10,12:
      if (D<1) or (D>31) then
      begin
        writeln('Incorrect data');
        InputDay:=false;
      end;

    2:
      if (D<1) or (D>28) then
        if (D=29) and FlagYear then
        else
        begin
          writeln('Incorrect data');
          InputDay:=false;
        end;

    4,6,9,11:
      if (D<1) or (D>30) then
      begin
        writeln('Incorrect data');
        InputDay:=false;
      end;
    end;
  until InputDay;

  if M=1 then
    Num:=D;

  if M>=2 then
  begin
    for I:=1 to M-1 do
      Num:=Num+Days[I];
    Num:=Num+D;
    if FlagYear and (M>=3) then
      Num:=Num+1;
  end;

  writeln(Num);

  readln;
end.


