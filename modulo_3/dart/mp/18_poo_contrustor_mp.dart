class Cocina {
  final String nombre;
  final String direccion;
  final int capacidad;
  final bool usaGas;

  Cocina({
    required this.nombre,
    required this.direccion,
    required this.capacidad,
    this.usaGas = true,
  });

  Cocina.local()
      : nombre = 'Cocina Central',
        direccion = 'Centro',
        capacidad = 10,
        usaGas = true;

  Cocina.franquicia({required this.nombre, required this.direccion})
      : capacidad = 20,
        usaGas = true;

  factory Cocina.desdeInfo(String data) {
    final partes = data.split(',');
    return Cocina(
      nombre: partes[0],
      direccion: partes[1],
      capacidad: int.parse(partes[2]),
      usaGas: partes[3] == 'gas',
    );
  }

  @override
  String toString() =>
      '$nombre en $direccion con capacidad $capacidad (gas: $usaGas)';
}

void main() {
  final c1 = Cocina(
    nombre: 'Cocina Dulce',
    direccion: 'Av. Principal',
    capacidad: 15,
  );

  final c2 = Cocina.local();
  final c3 = Cocina.franquicia(nombre: 'Cocina Norte', direccion: 'Zona Norte');
  final c4 = Cocina.desdeInfo('Cocina Express,Centro,12,gas');

  print(c1);
  print(c2);
  print(c3);
  print(c4);
}