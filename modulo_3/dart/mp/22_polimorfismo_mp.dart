abstract class Postre {
  String get nombre;
  double calcularCosto();
}

class Cheesecake extends Postre {
  final double ingredientes;
  Cheesecake(this.ingredientes);

  @override
  String get nombre => 'Cheesecake';

  @override
  double calcularCosto() => ingredientes * 2.5;
}

class Brownie extends Postre {
  final double gramosChocolate;
  Brownie(this.gramosChocolate);

  @override
  String get nombre => 'Brownie';

  @override
  double calcularCosto() => gramosChocolate * 1.2;
}

class Flan extends Postre {
  final double leche;
  Flan(this.leche);

  @override
  String get nombre => 'Flan';

  @override
  double calcularCosto() => leche * 1.0;
}

void imprimirCosto(Postre postre) {
  print('${postre.nombre}: ${postre.calcularCosto().toStringAsFixed(2)}');
}

void main() {
  final postres = <Postre>[
    Cheesecake(10),
    Brownie(8),
    Flan(12),
  ];

  for (final p in postres) {
    imprimirCosto(p);
  }

  final masCaro = postres.reduce(
    (a, b) => a.calcularCosto() > b.calcularCosto() ? a : b,
  );

  print('\nPostre mas caro: ${masCaro.nombre}');
}