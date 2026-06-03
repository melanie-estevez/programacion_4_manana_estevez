void main() {
  final nombrePostre = 'Cheesecake';
  final stock = 28;

  print('Postre disponible: $nombrePostre');

  print('${nombrePostre.toUpperCase()} tiene ${stock + 5} unidades despues del reabastecimiento');

  final ficha = '''
Postre: $nombrePostre
Stock:  $stock
Estado: ${stock > 0 ? 'Disponible' : 'Agotado'}
  ''';
  print(ficha);

  final rutaImagen = r'C:\Postres\Cheesecake\imagen.jpg';
  print(rutaImagen);

  final mensaje = 'Disfruta nuestro ' + nombrePostre + '!';
  print(mensaje);

  print(nombrePostre.toUpperCase());
  print('  Brownie  '.trim());
  print(nombrePostre.contains('cake'));
  print(nombrePostre.replaceAll('e', 'E'));
  print('cheesecake,brownie,flan'.split(','));
  print(nombrePostre.substring(0, 5));
  print(nombrePostre.startsWith('Chee'));
  print('45'.padLeft(5, '0'));
  print('45'.padRight(5, '0'));
}