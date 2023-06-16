Program LABA1_FunctionTYPE;

{$APPTYPE CONSOLE}

Const
  M = 2;
  Num = 2;

Type
  TArray = array [0..M,0..M] of Integer;

Var
  Matrix_1,Matrix_2,Add,Sub,LExp,RExp,FinalRes: TArray;

Function Input: TArray;
Var
  I,J,Error:Integer;
  Check: String;
Begin
  writeln('Enter your matrix');
  for I := low(Input) to high(Input) do
    for J := low(Input[I]) to high(Input[I]) do
      repeat
        write('Enter element [',I,',',J,'] : ');
        readln(Check);
        val (Check,Result[I,J],Error);
        if Error <> 0 then
          writeln('Incorrect input');
      until Error = 0;
  writeln;
end;

Function Output (Const OutArray: TArray): TArray;
Var
  I,J: Integer;
Begin
  writeln;
  for I := low(OutArray) to high(OutArray) do
  begin
    for J := low(OutArray[I]) to high(OutArray[I]) do
      write (OutArray[I,J]:4);
    writeln;
  end;
  writeln;
  Output:=OutArray;
end;


Function Add_Sub (Const SumArray,AddArray: TArray): TArray;
Var
  I,J:Integer;
Begin
  for I := low(SumArray) to high(SumArray) do
    for J := low(SumArray[I]) to high(SumArray[I]) do
      Add_Sub[I,J] := SumArray[I,J] + AddArray[I,J]
end;

Function Multiply (Const Mul_1,Mul_2: TArray): TArray;
Var
  I,J,L: Integer;
Begin
  for I := low(Mul_1) to high(Mul_1) do
    for J := low(Mul_2[I]) to high(Mul_2[I]) do
    begin
      Multiply[I,J] := 0;
      for L := low(Mul_1[I]) to high(Mul_1[I]) do
        Result[I,J] := Multiply[I,J] + Mul_1[I,L] * Mul_2[L,J];
    end;
end;

Function DigitMultiply(Const Digit: Integer; Const Matrix: TArray): TArray;
Var
  I,J: Integer;
Begin
  for I := low(Matrix) to high(Matrix) do
    for J := low(Matrix[I]) to high(Matrix[I]) do
      DigitMultiply[I,J] := Digit * Matrix[I,J];
end;

Begin

  Matrix_1:=Input;
  Matrix_2:=Input;
  writeln('Matrix 1 :');
  Matrix_1 := Output(Matrix_1);
  writeln('Matrix 2 :');
  Matrix_2 := Output(Matrix_2);

  Matrix_2:=DigitMultiply(-1,Matrix_2);
  Sub := Add_Sub(Matrix_1,Matrix_2);
  Matrix_2:=DigitMultiply(-1,Matrix_2);
  Add := Add_Sub(Matrix_1,Matrix_2);
  LExp := Multiply(Sub,Add);
  RExp := Multiply(Matrix_1,Matrix_2);
  RExp := DigitMultiply(Num,RExp);
  RExp:=DigitMultiply(-1,RExp);
  FinalRes := Add_Sub(LExp,RExp);

  writeln('(A - B) * (A + B) - 2 * A * B =');
  FinalRes := Output(FinalRes);

  readln;
end.
