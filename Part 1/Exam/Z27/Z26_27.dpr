Program Z26_27;

{$APPTYPE CONSOLE}

Const
  N = 25;

var
  y, eps, tmp: Real;
  X: array [1..N] of integer;
  i:byte;
  k:Integer;
begin
  writeln('Enter array of X: ');
  for i := 1 to N do
  begin
    Write('[',i,']: ');
    X[I]:=random(10);
  end;
  Write('Enter epsilon ');
  readln(eps);
  for i:=1 to N do
  begin
    y:=0;
    tmp:=1;
    k:=2;
    while(Abs(tmp) > eps) do
    begin
      y:= y + tmp;
      tmp:= tmp*(-1)*x[i]*x[i]/(k*(k-1));
      inc(k,2);
    end;
    Writeln(y:4:4);
  end;

  readln;
end.
