Program LABA1_Procedure;

{$APPTYPE CONSOLE}

Const
  M=3;
  Num=2;

Type
  TArray = array [1..M,1..M] of Integer;

Var
  Matrix_1,Matrix_2,Add,Sub,LExp,RExp,FinalRes: TArray;
  Minus: Boolean;

Procedure Input (Var InArray: TArray);
Var
  I,J,Error:Integer;
  Check: String;
Begin
  writeln('Enter your matrix');
  for I := low(InArray) to high(InArray) do
    for J := low(InArray[I]) to high(InArray[I]) do
      repeat
        write('Enter element [',I,',',J,'] : ');
        readln(Check);
        val (Check,InArray[I,J],Error);
        if Error <> 0 then
          writeln('Incorrect input');
      until Error = 0;
  writeln;
end;

Procedure Output (Const OutArray: TArray);
Var
  I,J: Integer;
Begin
  writeln;
  for I := low(OutArray) to high(OutArray) do
  begin
    for J := low(OutArray) to high(OutArray) do
      write (OutArray[I,J]:4);
    writeln;
  end;
  writeln;
end;

Procedure Add_Sub (Const SumArray,AddArray: TArray; Var Sum: TArray; Var Flag: Boolean);
Var
  I,J: Integer;
Begin

    for I := low(SumArray) to high(SumArray) do
      for J := low(SumArray[I]) to high(SumArray[I]) do
        if Flag then
          Sum[I,J] := SumArray[I,J] + AddArray[I,J]
        else
          Sum[I,J] := SumArray[I,J] - AddArray[I,J];
  Flag := not Flag;
end;

Procedure Multiply (Const Mul_1,Mul_2: TArray; Var Multiply: TArray);
Var
  I,J,L: Integer;
Begin
  for I := low(Mul_1) to high(Mul_1) do
    for J := low(Mul_2[I]) to high(Mul_2[I]) do
    begin
      Multiply[I,J] := 0;
      for L := low(Mul_1[I]) to high(Mul_1[I]) do
        Multiply[I,J] := Multiply[I,J] + Mul_1[I,L] * Mul_2[L,J];
    end;
end;

Procedure DigitMultiply (Const Digit: Integer; Const Matrix: TArray; Var MatrixRes: TArray);
Var
  I,J:Integer;
Begin
  for I := low(Matrix) to high(Matrix) do
    for J := low(Matrix[I]) to high(Matrix[I]) do
      MatrixRes[I,J] := Digit * Matrix[I,J];
end;

Begin

  Input(Matrix_1);
  Input(Matrix_2);
  writeln('Matrix 1 :');
  Output(Matrix_1);
  writeln('Matrix 2 :');
  Output(Matrix_2);

  Minus := false;

  Add_Sub(Matrix_1,Matrix_2,Sub,Minus);
  Add_Sub(Matrix_1,Matrix_2,Add,Minus);
  Multiply(Sub,Add,LExp);
  Multiply(Matrix_1,Matrix_2,RExp);
  DigitMultiply(Num,RExp,RExp);
  Add_Sub(LExp,RExp,FinalRes,Minus);

  writeln('(A - B) * (A + B) - 2 * A * B =');
  Output(FinalRes);

  readln;
end.
