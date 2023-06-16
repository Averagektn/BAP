Program LAB10;

{$APPTYPE CONSOLE}

// Uses declarations
Uses
  Math;

// Type declarations
Type
  TPFormula = Procedure(Const Arg,P: Real; Var Res: Real);
  TPCount = Procedure(Const A,B: Real; Const N: Integer; Var Int: Real; Formula: TPFormula);
  TFFormula = Function(Const Arg: Real): Real;
  TFCount = Function(Const A,B: Real; N: Integer; Formula: TFFormula): Real;
// TPFomula - procedure for changing formulas
// TPCount - procedure for changing type of counts
// TFFormula - function for changing formulas
// TFCount - function for changing type of counts

// Local variables declaration
Var
  L,R,Intg,Epsilon: Real;
  Num: Integer = 10;
// L,R - borders
// Intg - result
// Epsilon - accuracy
// Num - number of iterations

// Procedure for input
// Value - accuracy

Procedure CheckInput(Var Value: Real);

// Local variables declaration
Var
  Error: Integer;
  Str: String;
// Error - check
// Str - input string

begin

  // Entering value, checking it
  repeat
    write('Enter epsilon: ');
    readln(Str);
    val(Str,Value,Error);
    if (Error <> 0) or (Value <= 0) then
      writeln('Incorrect input');
  until (Error = 0) and (Value > 0);

  writeln;

end;

// First formula
Function FFormula_1(Const Arg: Real): Real;
begin
  Result := 1/(sqrt(3 * sqr(Arg) - 1));
end;

// Second formula
Function FFormula_2(Const Arg: Real): Real;
begin
  Result := (ln(sqr(Arg) + 1) / ln(10)) / Arg;
end;

// Right rectangle integral
Function FRightRectangle(Const A,B: Real; N: Integer; Formula: TFFormula): Real;
Var
  I: Integer;
  H,X: Real;
begin
  H := (B - A) / N;
  Result := 0;

  for I := 1 to N do
  begin
    X := A + I * H;
    Result := Result + H * Formula(X);
  end;

end;

// Trapezoid integral
Function FTrapezoid(Const A,B: Real; N: Integer; Formula: TFFormula): Real;
Var
  I: Integer;
  H,X: Real;
begin
  H := (B - A) / N;

  X := A;
  Result := H * Formula(X);

  X := B;
  Result := Result + H * Formula(X);

  Result := Result / 2;

  for I := 1 to N - 1 do
  begin
    X := A + I * H;
    Result := Result + H * Formula(X);
  end;

end;

// Integral count
Function FIntegral(Const A,B,Eps: Real; Nm: Integer; Count: TFCount; Form: TFFormula): Real;
Var
  Tmp: Real;
begin
  Result := 0;

  repeat
    Tmp := Result;
    Result := Count(A,B,Nm,Form);
    Nm := Nm + 10;
    Tmp := Result - Tmp;
  until abs(Tmp) <= Eps;

end;

// First formula
Procedure PFormula_1(Const Arg,P: Real; Var Res: Real);
begin
  Res := Res + P/(sqrt(3 * sqr(Arg) - 1));
end;

// Second formula
Procedure PFormula_2(Const Arg,P: Real; Var Res: Real);
begin
  Res := Res + P * (ln(sqr(Arg) + 1) / ln(10)) / Arg;
end;

// Right rectangle interal
Procedure PRightRectangle(Const A,B: Real; Const N: Integer; Var Int: Real; Formula: TPFormula);
Var
  I: Integer;
  H,X: Real;
begin
  H := (B - A) / N;
  Int := 0;

  for I := 1 to N do
  begin
    X := A + I * H;
    Formula(X,H,Int);
  end;

end;

// Trapezoid integral
Procedure PTrapezoid(Const A,B: Real; Const N: Integer; Var Int: Real; Formula: TPFormula);
Var
  I: Integer;
  H,X: Real;
begin
  H := (B - A) / N;
  Int := 0;

  X := A;
  Formula(X,H,Int);

  X := B;
  Formula(X,H,Int);

  Int := Int / 2;

  for I := 1 to N - 1 do
  begin
    X := A + I * H;
    Formula(X,H,Int);
  end;

end;

// Integral count
Procedure PIntegral(Const A,B,Eps: Real; Nm: Integer; Var Int: Real; Count: TPCount; Form: TPFormula);
Var
  Tmp: Real;
begin
  Int := 0;

  repeat
    Tmp := Int;
    Count(A,B,Nm,Int,Form);
    Nm := Nm + 10;
    Tmp := Int - Tmp;
  until abs(Tmp) <= Eps;

end;

Begin
  L := 1.4;
  R := 2.1;
  CheckInput(Epsilon);
  writeln('Formula 1 with procedures:');
  writeln;

  PIntegral(L,R,Epsilon,Num,Intg,PRightRectangle,PFormula_1);
  writeln('Right rectangle: ',Intg:0:7);

  PIntegral(L,R,Epsilon,Num,Intg,PTrapezoid,PFormula_1);
  writeln('Trapezoid: ',Intg:15:7);

  L := 0.8;
  R := 1.6;

  writeln;
  writeln('Formula 2 with procedures:');
  writeln;

  PIntegral(L,R,Epsilon,Num,Intg,PRightRectangle,PFormula_2);
  writeln('Right rectangle: ',Intg:0:7);

  PIntegral(L,R,Epsilon,Num,Intg,PTrapezoid,PFormula_2);
  writeln('Trapezoid: ',Intg:15:7);

  L := 1.4;
  R := 2.1;

  writeln;
  writeln('Formula 1 with functions:');
  writeln;

  Intg := FIntegral(L,R,Epsilon,Num,FRightRectangle,FFormula_1);
  writeln('Right rectangle: ',Intg:0:7);

  Intg := FIntegral(L,R,Epsilon,Num,FTrapezoid,FFormula_1);
  writeln('Trapezoid: ',Intg:15:7);

  L := 0.8;
  R := 1.6;

  writeln;
  writeln('Formula 2 with finctions:');
  writeln;

  Intg := FIntegral(L,R,Epsilon,Num,FRightRectangle,FFormula_2);
  writeln('Right rectangle: ',Intg:0:7);

  Intg := FIntegral(L,R,Epsilon,Num,FTrapezoid,FFormula_2);
  writeln('Trapezoid: ',Intg:15:7);

  readln;
end.
