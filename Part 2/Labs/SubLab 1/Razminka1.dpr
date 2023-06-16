Program Razminka1;

{$APPTYPE CONSOLE}

Const
  Max=9;
  Min=0;

Type
  TArray = Array [Min..Max,0..1] of Real;
  TDist = Array [Min..Max] of Real;
  TComp = Function (Const Param1, Param2: Real): Boolean;
  TMax = Array[0..3] of Real;

Var
  Points: TArray = ((145,112),(33,168),(33,162),(122,58),(78,98),(126,82),(125,93),(114,-58),(126,-28),(138,-62));
  Distance: TDist;
  MaxL: TMax;
  Temp,Eps,MaxX,MinX,Left,Right,Range,Center,Point: Real;
  I,J,Ind: Integer;

Function CheckInput: Real;
Var
  Error: Integer;
  Check: String;
begin
  repeat
    readln(Check);
    val(Check,Result,Error);
    if (Error <> 0) or (Result<=0) then
      writeln('Incorrect input');
  until (Error = 0) and (Result>0);
end;

Procedure InputK(Var Arr: TArray);
Var
  I,J: Integer;
begin
  Randomize;
  for I := low(Arr) to high(Arr) do
    for J := low(Arr[I]) to high(Arr[I]) do
      Arr[I,J] := CheckInput;
  writeln;
end;

Procedure Input(Var Arr: TArray);
Var
  I,J: Integer;
begin
  //Randomize;
  for I := low(Arr) to high(Arr) do
    for J := low(Arr[I]) to high(Arr[I]) do
      Arr[I,J] := Random(999999)/1000;
  writeln;
end;

Procedure Output(Const Arr: TArray);
Var
  I,J: Integer;
begin
  for I := low(Arr) to high(Arr) do
  begin
    for J := low(Arr[I]) to high(Arr[I]) do
      write(Arr[I,J]:7:3,' ');
    writeln;
  end;
  writeln;
end;

Function CountDist (Const Arr: TArray; Const Start: Real): TDist;
Var
  I: Integer;
begin
  for I := low(Result) to high(Result) do
    Result[I] := (Arr[I,0] - Start) * (Arr[I,0] - Start) + Arr[I,1] * Arr[I,1];
end;

Function More (Const Param1,Param2: Real): Boolean;
begin
  Result := Param1 > Param2;
end;

Function Less (Const Param1,Param2: Real): Boolean;
begin
  Result := Param1 < Param2;
end;

Function Find (Compare: TComp; Const Arr: TArray): Real;
Var
  I: Integer;
begin
  Result := Arr[low(Arr),low(Arr[low(Arr)])];
  for I := low(Arr) + 1 to high(Arr) do
    if Compare(Arr[I,low(Arr[low(Arr)])],Result) then
      Result := Points[I,low(Arr[low(Arr)])];
end;

Function TerSearch (Param: Real; Const L,R: Real; Const Arr: TArray):TMax;
Var
  Distance: TDist;
  I,J: Integer;
begin
  for I := low(Result) to high(Result) do
    begin
      Distance := CountDist(Arr,Param);
      Result[I] := Distance[low(Distance)];
      for J := low(Distance) + 1 to high(Distance) do
        if Distance[J] > Result[I] then
          Result[I] := Distance[J];
      Param := Param + (R - L) / 3;
    end;
end;

Procedure PNew (Var L,R,P: Real; Const I: Integer);
begin
    P := L + I * (R - L) / 3;
    L := P - (R - L) / 3;
    R := P + (R - L) / 3;
end;

Begin
  writeln('Points:');
  writeln('X':4,'Y':8);
  Input(Points);
  Output(Points);
  writeln('Enter epsilon');
  Eps := CheckInput;

  MaxX := Find(More,Points);
  MinX := Find(Less,Points);
  Left := MinX;
  Right := MaxX;

  repeat
    Point := Left;
    Temp := Point;
    MaxL := TerSearch(Point,Left,Right,Points);

    Center := MaxL[low(MaxL)];
    Ind := 0;
    for I := low(MaxL) + 1 to high(MaxL) do
      if MaxL[I] < Center then
      begin
        Center := MaxL[I];
        Ind := I;
      end;

    PNew(Left,Right,Point,Ind);
    Range := Point - Temp;
  until (Eps >= Range);

  writeln('Point : (',Point:0:3,',0)');

  readln;
end.
