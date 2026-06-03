void main() {
  int cantidadPostres = 42;
  double cantidadDecimal = cantidadPostres.toDouble();
  String cantidadTexto = cantidadPostres.toString();

  print(cantidadDecimal);
  print(cantidadTexto);

  int stock = int.parse('123');
  double precio = double.parse('3.14');

  print(stock);
  print(precio);

  int? pedidos = int.tryParse('abc');
  double? descuento = double.tryParse('99');

  print(pedidos);
  print(descuento);

  Object postre = 'Cheesecake';
  if (postre is String) {
    print(postre.length);
  }

  Object dato = 'Brownie';
  String nombrePostre = dato as String;
  print(nombrePostre);

  String? cobertura = null;
  int longitud = cobertura?.length ?? 0;
  print(longitud);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}