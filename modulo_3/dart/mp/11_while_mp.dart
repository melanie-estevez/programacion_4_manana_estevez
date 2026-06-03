void main() {
  int pedidos = 0;
  int stock = 120;

  while (stock > 0) {
    final cantidad = stock > 30 ? 30 : stock;
    pedidos++;
    stock -= cantidad;
    print('Pedido $pedidos: $cantidad postres (restante: $stock)');
  }

  int intentos = 0;
  bool cocinaLista = false;

  do {
    intentos++;
    print('Verificando cocina intento #$intentos...');
    if (intentos == 2) cocinaLista = true;
  } while (!cocinaLista && intentos < 5);

  print(cocinaLista
      ? 'Cocina lista tras $intentos intentos'
      : 'Cocina no disponible');
}