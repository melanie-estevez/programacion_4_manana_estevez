class Plato {
  final String id;
  final String nombre;
  final String codigo;
  final int    tiempoPrep;
  final bool   disponible;
  bool         destacado;

  Plato({
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.tiempoPrep,
    required this.disponible,
    this.destacado = false,
  });
}
