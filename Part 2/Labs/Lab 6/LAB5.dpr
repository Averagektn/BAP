{Find the least range from point on x line to all 10 points}
Program LAB5;

// Console app
{$APPTYPE CONSOLE}

// Uses declaration
Uses
  Lib;
// Lib - IO procedures

// Constant declaration
Const
  Max=9;
  Min=0;
// Max,Min - array borders

// Type declaration
Type
  TArray = Array [Min..Max,0..1] of Real;
  TDist = Array [Min..Max] of Real;
  TComp = Function (Const Param1, Param2: Real): Boolean;
  TMax = Array[0..3] of Real;
// TArray - starting array
// TDist - disatnces
// TComp - compareing procedures
// TMax - point

// Variables declaration
Var
  Points: TArray = ((145,112),(33,168),(33,162),(122,58),(78,98),(126,82),(125,93),(114,-58),(126,-28),(138,-62));
  Distance: TDist;
  MaxL: TMax;
  Temp,Eps,MaxX,MinX,Left,Right,Range,Center,Point: Real;
  I,J,Ind: Integer;
// Points - startiong points
// Distance - length
// MaxL - maximum distance
// Temp - memory
// Eps - precession
// MaxX,MinX - coordinates
// Left,Right - borders
// Center - center of the range
// Point - x coordinate
// I,J,Ind - iterators

// Call of distance count procedure
{$I CountDist}

// Call of compare subprograms
{$I CMP.pas}

// Call of finding procedure
{$I Find.txt}

// Main function that divides range into 3 parts
Function TerSearch (Param,L,R: Real; Arr: TArray):TMax;
Var
  Distance: TDist;
  I,J: Integer;
begin

  // Counting cycle
  for I := low(Result) to high(Result) do
    begin
      CountDist(Arr,Param,Distance);
      Result[I] := Distance[low(Distance)];
      for J := low(Distance) + 1 to high(Distance) do
        if Distance[J] > Result[I] then
          Result[I] := Distance[J];
      Param := Param + (R - L) / 3;
    end;
end;

// Counting new range borders
Procedure PNew (Var L,R,P: Real; Const I: Integer);
begin
    P := L + I * (R - L) / 3;
    L := P - (R - L) / 3;
    R := P + (R - L) / 3;
end;

Begin
  writeln('Points:');
  writeln('X':4,'Y':8);
  //Input(Points);

  // Out
  Output(Points);
  writeln('Enter epsilon');

  // Input of precession
  Eps := CheckInput;

  // FInding coordinates of x
  MaxX := Find(More,Points);
  MinX := Find(Less,Points);

  // Finding borders
  Left := MinX;
  Right := MaxX;

  // Mainf part that counts ranges,points and distances until precession
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

  writeln;
  Center:=exp(ln(Center)/2);
  write('Range: ');
  writeln(Center:0:0);
  writeln('Point : (',Point:0:3,',0)');

  readln;
end.
