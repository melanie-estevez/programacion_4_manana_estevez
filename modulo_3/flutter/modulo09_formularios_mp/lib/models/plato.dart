class Plato {
  final String id;
  final String nombre;
  final String codigo;
  final int    tiempoPrep;
  final String chef;
  final String categoria;
  final bool   disponible;
  final String tipo;
  bool         destacado;

  Plato({
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.tiempoPrep,
    required this.chef,
    required this.categoria,
    required this.disponible,
    required this.tipo,
    this.destacado = false,
  });
}
