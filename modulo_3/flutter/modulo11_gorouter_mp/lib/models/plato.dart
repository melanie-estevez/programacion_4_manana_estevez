class Plato {
  final String id;
  final String nombre;
  final String codigo;
  final int    tiempoPrep;
  final bool   disponible;

  const Plato({
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.tiempoPrep,
    required this.disponible,
  });
}

const platosSimulados = [
  Plato(id: '1', nombre: 'Ceviche Clásico', codigo: 'PLT-001',   tiempoPrep: 15,   disponible: true),
  Plato(id: '2', nombre: 'Lomo Saltado',  codigo: 'PLT-002',   tiempoPrep: 25,   disponible: true),
  Plato(id: '3', nombre: 'Ají de Gallina', codigo: 'PLT-003',   tiempoPrep: 20, disponible: false),
];
