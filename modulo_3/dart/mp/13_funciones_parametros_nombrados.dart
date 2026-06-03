void configurarCocina({
  required String chef,
  required int estaciones,
  bool aireAcondicionado = true,
  int tiempoPreparacion = 30,
}) {
  final estado = aireAcondicionado ? 'climatizada' : 'normal';
  print('Chef $chef en cocina $estado con $estaciones estaciones (tiempo: ${tiempoPreparacion} min)');
}

void main() {
  configurarCocina(
    chef: 'Ana',
    estaciones: 4,
    aireAcondicionado: false,
    tiempoPreparacion: 45,
  );

  configurarCocina(
    chef: 'Luis',
    estaciones: 6,
  );
}