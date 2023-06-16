Program Lab3;

{$APPTYPE CONSOLE}

Type
  TArray = array [1..15] of integer;

Var
  Arr: TArray = (9,3,-2,5,0,7,1,0,-9,8,2,3,-4,5,6);


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
    InArr[I] := Random(30)+1;
end;

Procedure Swap(Var Param1,Param2:Integer);
Var
  Temp: Integer;
begin
  Temp:=Param1;
  Param1:=Param2;
  Param2:=Temp;
end;

Procedure QuickSort (Var QuickSortedArr: TArray);
Var
  I,J,Supp,Left,Right,L,K: Integer;
  SArr: array of array [0..1] of integer;
Begin
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
          writeln('I=',I:3,'J=',J:3);
          Swap(QuickSortedArr[I],QuickSortedArr[J]);
          writeln;
          for K:=low(QuickSortedArr) to high(QuickSortedArr) do
            write(QuickSortedArr[K]:3);
          writeln;

          Inc(I);
          Dec(J);

          writeln;
        end;
      until I > J;
      if I < Right then
      begin
        Inc(L);
        SArr[L,0] := I;
        SArr[L,1] := Right;
        for K:=low(SArr) to high(SArr) do
          writeln(SArr[K,0]:3,SArr[K,1]:3);
        writeln;
      end;
      Right := J;
    until Left >= Right;
  until L < 0;
end;

begin
  //Input(Arr);
  Output(Arr);
  QuickSort(Arr);
  Output(Arr);
  readln;
end.
