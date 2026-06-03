void main() {
  final postres = ['Cheesecake', 'Brownie', 'Tiramisu', 'Flan', 'Gelatina'];

  for (final postre in postres) {
    print(postre);
  }

  postres.forEach((p) => print(p.toLowerCase()));

  final precios = {
    'Cheesecake': 4.5,
    'Brownie': 3.0,
    'Tiramisu': 5.0,
    'Flan': 2.5
  };

  for (final entrada in precios.entries) {
    print('${entrada.key} cuesta \$${entrada.value}');
  }

  for (final letra in 'Postre'.split('')) {
    print(letra);
  }
}