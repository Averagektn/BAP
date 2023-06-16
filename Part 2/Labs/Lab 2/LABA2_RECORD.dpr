Program LABA2_RECORD;

{$APPTYPE CONSOLE}

Type
  TArray = array of integer;
  Table = Record
    ArrType: String;
    Amount,NExpS,NExpQ,NTeorS: Integer;
    NTeorQ:real;
  end;
  TRes = Array [0..17] of Table;
  TComp = Function (Const Param1, Param2: Integer): Boolean;


Var
  ArrShaker,ArrQuick: TArray;
  K:Integer;
  Res: TRes;

Function More (Const Param1, Param2: Integer): Boolean;
begin
  Result := Param1 > Param2;
end;

Function Less (Const Param1, Param2: Integer): Boolean;
begin
  Result := Param1 < Param2;
end;

Procedure Output (Const OutArr: TArray);
Var
  I: Integer;
Begin
  writeln;
  for I := low(OutArr) to high(OutArr) do
    write(OutArr[I]:5);
  writeln;
end;

Procedure Input (Var InArr: TArray);
Var
  I: Integer;
Begin
  Randomize;
  for I := low(InArr) to high(InArr) do
    InArr[I] := Random(10000);
end;

Function CheckInput: Integer;
Var
  Error: Integer;
  Check: String;
begin
  repeat
    write('Enter the size of the array: ');
    readln(Check);
    val(Check,Result,Error);
    if (Error<>0) or (Result<=1) then
      writeln('Incorrect input');
  until (Error=0) and (Result>1);
end;

Procedure Swap (Var Value1,Value2,Count: Integer);
Var
  Temp: Integer;
Begin
  Temp := Value1;
  Value1 := Value2;
  Value2 := Temp;
  Count := Count + 3;
end;

Procedure Shaker (Var ShakerSortedArr: TArray; Var Replacements: Integer; Compare: TComp);
Var
  I,J,UpBorder,DownBorder: Integer;
Begin
  UpBorder := high(ShakerSortedArr);
  DownBorder := 0;
  for I := high(ShakerSortedArr) downto low(ShakerSortedArr) do
    begin
      for J := DownBorder to I - 1 do
        if Compare(ShakerSortedArr[J],ShakerSortedArr[J + 1]) then
          Swap(ShakerSortedArr[J],ShakerSortedArr[J + 1],Replacements);
      Dec(UpBorder);
      for J := UpBorder downto 1 do
        if Compare(ShakerSortedArr[J - 1],ShakerSortedArr[J]) then
          Swap(ShakerSortedArr[J],ShakerSortedArr[J - 1],Replacements);
      Inc(DownBorder);
    end;
end;

Procedure QuickSort (Var QuickSortedArr: TArray; Var Replacements:Integer);
Var
  I,J,Supp,Left,Right,L: Integer;
  SArr: array of array [0..1] of integer;
Begin
  Replacements:=0;
  L:=0;
  setlength(SArr,high(QuickSortedArr));
  SArr[0,0] := low(QuickSortedArr);
  SArr[0,1] := high(QuickSortedArr);
  repeat
    Left := SArr[L,0];
    Right := SArr[L,1];
    Dec(L);
    repeat
      I := Left;
      J := Right;
      Supp := QuickSortedArr[(Left+Right) div 2];
      repeat
        while QuickSortedArr[I] < Supp do
          Inc(I);
        while Supp < QuickSortedArr[J] do
          Dec(J);
        if I <= J then
        begin
          Swap(QuickSortedArr[I],QuickSortedArr[J],Replacements);
          Inc(I);
          Dec(J);
        end;
      until I > J;
      if I < Right then
      begin
        Inc(L);
        SArr[L,0] := I;
        SArr[L,1] := Right;
      end;
      Right := J;
    until Left >= Right;
  until L < 0;
end;

Procedure OutRes (MessageOut: TRes);
Var
  I: Integer;
begin
  writeln;
  writeln('Result table:':36);
  writeln;
  writeln('Size |','   Type   |','  Experimental       |':27,' Theoretical ':20);
  writeln;
  writeln('|':6,'| Shaker sort |':25,' Quick sort |',' Shaker sort |',' Quick sort');
  writeln;
  for I:=0 to 17 do
  begin
    writeln(Res[I].Amount:4,' |',Res[I].ArrType:9,' |',Res[I].NExpS:12,' |',Res[I].NExpQ:11,' |',Res[I].NTeorS:12,' |',Res[I].NTeorQ:11:0);
    writeln
  end;
end;

Begin

  for K:=0 to 5 do
  begin
    Res[K].Amount:=CheckInput;

    setlength(ArrShaker,Res[K].Amount);
    setlength(ArrQuick,Res[K].Amount);

    Input(ArrShaker);
    ArrQuick:=ArrShaker;

    Shaker(ArrShaker,Res[K].NExpS,More);
    QuickSort(ArrQuick,Res[K].NExpQ);

    Res[K].ArrType:='Unsorted';
    Res[K].NTeorS:=3*Res[K].Amount*(Res[K].Amount - 1) div 4;
    Res[K].NTeorQ:=(Res[K].Amount*ln(Res[K].Amount) / ln(2)) / 6;
  end;

  for K:=6 to 11 do
  begin
    Res[K].Amount:=Res[K-6].Amount;

    setlength(ArrShaker,Res[K].Amount);
    setlength(ArrShaker,Res[K].Amount);

    Input(ArrShaker);
    Shaker(ArrShaker,Res[K].NExpS,More);
    Res[K].NExpS:=0;
    ArrQuick:=ArrShaker;

    Shaker(ArrShaker,Res[K].NExpS,More);
    QuickSort(ArrQuick,Res[K].NExpQ);

    Res[K].ArrType:='Sorted';
    Res[K].NTeorS:=0;
    Res[K].NTeorQ:=(Res[K].Amount*ln(Res[K].Amount) / ln(2)) / 6;
  end;


  for K:=12 to 17 do
  begin

    Res[K].Amount:=Res[K-6].Amount;

    setlength(ArrShaker,Res[K].Amount);
    setlength(ArrShaker,Res[K].Amount);

    Input(ArrShaker);
    Shaker(ArrShaker,Res[K].NExpS,Less);
    Res[K].NExpS:=0;
    ArrQuick:=ArrShaker;

    Shaker(ArrShaker,Res[K].NExpS,More);
    QuickSort(ArrQuick,Res[K].NExpQ);

    Res[K].ArrType:='Inverted';
    Res[K].NTeorS:=3*Res[K].Amount*(Res[K].Amount - 1) div 2;
    Res[K].NTeorQ:=(Res[K].Amount*ln(Res[K].Amount) / ln(2)) / 6;
  end;

  OutRes(Res);

  readln;
end.
