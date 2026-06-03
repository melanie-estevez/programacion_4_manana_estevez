void main() {
  var nombrePostre = 'Cheesecake';
  var cantidad = 15;
  var precio = 4.50;
  var disponible = true;

  String categoria = 'Pasteles';
  int stock = 30;
  double descuento = 0.10;
  bool promocion = false;

  final sucursal = 'Centro';

  const impuesto = 0.12;
  const porcionBase = 1.0;

  final fechaRegistro = DateTime.now();

  var pedidos = 0;
  pedidos = 1;

  final ingredientes = ['Queso crema', 'Galleta', 'Azucar'];
  ingredientes.add('Vainilla');

  const sabores = ['Chocolate', 'Fresa'];

  print(nombrePostre);
  print(cantidad);
  print(precio);
  print(disponible);
  print(categoria);
  print(stock);
  print(descuento);
  print(promocion);
  print(sucursal);
  print(impuesto);
  print(porcionBase);
  print(fechaRegistro);
  print(pedidos);
  print(ingredientes);
  print(sabores);
}