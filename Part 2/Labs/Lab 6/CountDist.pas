// Distance couting procedure
Procedure CountDist (Var Arr: TArray; Var Start: Real; Var Dist);
Type
  TDist = Array [0..9] of Real;
Var
  I: Integer;
// I - cycle iterator

begin

  // Countong cycle
  for I := low(TDist(Dist)) to high(TDist(Dist)) do
    TDist(Dist)[I] := (Arr[I,0] - Start) * (Arr[I,0] - Start) + Arr[I,1] * Arr[I,1];
end;

 