void main() {
  final precios = [4.50, 3.00, 5.00, 2.50];

  final preciosConIva = precios.map((p) => p * 1.15);
  print(preciosConIva.toList());

  final postres = ['cheesecake', 'brownie', 'tiramisu'];
  final menu = postres.map((p) => 'Postre: $p');

  print(menu.toList());
}