class Postre {
  final String id;
  final String nombre;
  String sabor;
  bool _disponible = false;

  Postre({
    required this.id,
    required this.nombre,
    required this.sabor,
  });

  bool get disponible => _disponible;
  String get estado => _disponible ? 'disponible' : 'agotado';

  set estadoDisponible(bool valor) {
    _disponible = valor;
    print('$nombre: ${valor ? "disponible" : "agotado"}');
  }

  void activar() {
    _disponible = true;
    print('$nombre listo para venta');
  }

  void desactivar() {
    _disponible = false;
    print('$nombre fuera de venta');
  }

  String resumen() => 'ID: $id | Nombre: $nombre | Sabor: $sabor | Estado: $estado';

  @override
  String toString() => 'Postre($nombre, $sabor, $estado)';
}

void main() {
  final cheesecake = Postre(
    id: 'DES-001',
    nombre: 'Cheesecake',
    sabor: 'Fresa',
  );

  cheesecake.activar();
  print(cheesecake.estado);
  print(cheesecake.resumen());
  print(cheesecake);

  cheesecake.estadoDisponible = false;
  print(cheesecake.disponible);
}