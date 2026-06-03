void main() {
  String nombrePostre = 'Cheesecake';

  String? cobertura = null;
  cobertura = 'Chocolate';

  String? sabor = 'Fresa';

  print(sabor?.length);

  String resultado = sabor ?? 'Sin sabor';
  print(resultado);

  String saborSeguro = sabor!;
  print(saborSeguro);

  if (cobertura != null) {
    print(cobertura.length);
  }

  late String codigoPedido;
  codigoPedido = 'PED001';
  print(codigoPedido);

  print(nombrePostre);
}