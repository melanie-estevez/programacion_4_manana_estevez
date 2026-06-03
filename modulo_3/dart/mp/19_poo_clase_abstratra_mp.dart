abstract class Postre {
  String get nombre;
  double calcularCosto();
  double calcularPrecio();

  void describir() {
    print(
        '$nombre - costo: ${calcularCosto().toStringAsFixed(2)}, precio: ${calcularPrecio().toStringAsFixed(2)}');
  }
}

class Cheesecake extends Postre {
  final double ingredientes;

  Cheesecake(this.ingredientes);

  @override
  String get nombre => 'Cheesecake';

  @override
  double calcularCosto() => ingredientes * 2.5;

  @override
  double calcularPrecio() => calcularCosto() * 1.8;
}

class Brownie extends Postre {
  final double gramosChocolate;

  Brownie(this.gramosChocolate);

  @override
  String get nombre => 'Brownie';

  @override
  double calcularCosto() => gramosChocolate * 1.2;

  @override
  double calcularPrecio() => calcularCosto() * 1.5;
}

void main() {
  final postres = <Postre>[
    Cheesecake(10),
    Brownie(8),
  ];

  for (final p in postres) {
    p.describir();
  }
}