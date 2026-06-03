void saludarCliente() {
  print('Bienvenido a la pasteleria');
}

int calcularTotal(int a, int b) {
  return a + b;
}

int totalFijo() {
  return 5 + 2;
}

int multiplicarPorciones(int a, int b) => a * b;

String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

formatearPrecioSimple(double precio) => '\$${precio.toStringAsFixed(2)}';

String construirPedido(String cliente, String postre, [int? mesa]) {
  if (mesa != null) {
    return 'Pedido de $cliente: $postre en mesa $mesa';
  }
  return 'Pedido de $cliente: $postre';
}

String construirPedidoV2(String cliente, String postre, [int mesa = 1]) {
  return 'Pedido de $cliente: $postre en mesa $mesa';
}

void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

void main() {
  print(calcularTotal(5, 3));
  print(multiplicarPorciones(4, 6));
  imprimirSeparador('Inicio de pedidos');
  saludarCliente();
  print(totalFijo());
  print(formatearPrecio(1299.9));
  print(construirPedido('Ana', 'Cheesecake'));
  print(construirPedido('Luis', 'Brownie', 3));
  print(construirPedidoV2('Maria', 'Tiramisu'));
}