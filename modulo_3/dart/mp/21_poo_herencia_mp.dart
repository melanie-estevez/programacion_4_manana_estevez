class Postre {
  final String nombre;
  final int porciones;

  Postre(this.nombre, this.porciones);

  String preparar() => '...';

  void presentar() {
    print('Postre $nombre con $porciones porciones: ${preparar()}');
  }
}

class Cheesecake extends Postre {
  Cheesecake(super.nombre, super.porciones);

  @override
  String preparar() => 'Crema de queso lista';

  void decorar() => print('$nombre decorado con fresas');
}

class Brownie extends Postre {
  Brownie(super.nombre, super.porciones);

  @override
  String preparar() => 'Chocolate horneado';

  void servir() => print('$nombre servido caliente');
}

void main() {
  final cheesecake = Cheesecake('Cheesecake', 8);
  final brownie = Brownie('Brownie', 6);

  cheesecake.presentar();
  brownie.presentar();

  cheesecake.decorar();
  brownie.servir();
}