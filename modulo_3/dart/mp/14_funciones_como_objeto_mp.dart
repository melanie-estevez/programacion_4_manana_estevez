int duplicarStock(int n) => n * 2;
int triplicarStock(int n) => n * 3;

void main() {
  int Function(int) operacion;

  operacion = duplicarStock;
  print(operacion(5));

  operacion = triplicarStock;
  print(operacion(5));

  final transformaciones = <int Function(int)>[duplicarStock, triplicarStock];

  for (final fn in transformaciones) {
    print(fn(10));
  }
}