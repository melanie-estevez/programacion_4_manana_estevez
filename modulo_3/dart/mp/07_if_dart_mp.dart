void main(dynamic postre) {
  int stock = 38;

  if (stock > 30) {
    print('Disponible');
  } else if (stock > 0) {
    print('Pocas unidades');
  } else {
    print('Agotado');
  }

  String estado = stock > 30 ? 'Stock alto' : 'Stock bajo';
  print(estado);

  String? cobertura;
  String descripcion =
      cobertura != null ? cobertura.toUpperCase() : 'Sin cobertura';

  print(descripcion);

  String descripcion2 =
      cobertura?.toUpperCase() ?? 'Sin cobertura';

  print(descripcion2);

  print(postre?.length);

  int longitud = postre?.length ?? 0;
  print(longitud);
}