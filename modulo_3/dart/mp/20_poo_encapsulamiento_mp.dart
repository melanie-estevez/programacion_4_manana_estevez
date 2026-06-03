class CajaRestaurante {
  final String responsable;
  double _ingresos;

  CajaRestaurante(this.responsable, double saldoInicial)
      : _ingresos = saldoInicial;

  double get ingresos => _ingresos;

  void registrarVenta(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    _ingresos += monto;
    print('Venta de \$$monto. Total ingresos: \$$_ingresos');
  }

  void registrarGasto(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    if (monto > _ingresos) throw StateError('Fondos insuficientes');
    _ingresos -= monto;
    print('Gasto de \$$monto. Total ingresos: \$$_ingresos');
  }
}

void main() {
  final caja = CajaRestaurante('Maria', 300.0);

  caja.registrarVenta(120.0);
  caja.registrarGasto(50.0);

  print(caja.ingresos);
}