program zadanie;

const
  dx = 0.001;

function Func(x: Real): Real;
begin
  Func := 1*x*x*x + (-2)*x*x + (2)*x + (17);
end;

function RightRectangleMethod(a, b: Real): Real;
var
  x: Real;
begin
  Result := 0;
  x := a; 

  while x < b do
  begin
    Result := Result + dx * Func(x);
    x := x + dx;
  end;
end;

procedure EvaluateError(a, b: Real; n: Integer);
var
  h, integral, integral_half: Real;
begin
  h := (b - a) / n;

  integral := RightRectangleMethod(a, b);
  integral_half := RightRectangleMethod(a, b - h);

  writeln('Погрешность: ', Abs(integral - integral_half) / 3);
end;

var
  a, b: Real;
  n: Integer;
  choice: Integer;

begin
  writeln('Введите пределы интегрирования:');
  write('a = '); readln(a);
  write('b = '); readln(b);

  writeln('Введите количество прямоугольников для метода правых прямоугольников:');
  readln(n);

  writeln('Выберите действие:');
  writeln('1. Вычислить площадь фигуры');
  writeln('2. Оценить погрешность');
  readln(choice);

  case choice of
    1: writeln('Площадь фигуры: ', RightRectangleMethod(a, b));
    2: EvaluateError(a, b, n);
  else
    writeln('Неверный выбор');
  end;
end.
