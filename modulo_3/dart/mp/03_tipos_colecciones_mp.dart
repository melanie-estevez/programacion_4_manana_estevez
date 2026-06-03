void main() {
  List<String> postres = ['cheesecake', 'brownie', 'tiramisu'];
  var precios = [4, 5, 6, 7, 8];

  print(postres[0]);
  print(postres.length);
  postres.add('flan');
  postres.remove('brownie');

  Map<String, int> inventario = {
    'cheesecake': 15,
    'tiramisu': 10,
    'flan': 20,
  };

  print(inventario['cheesecake']);
  print(inventario['gelatina']);
  inventario['brownie'] = 12;

  Set<String> sabores = {'chocolate', 'vainilla', 'fresa'};
  sabores.add('chocolate');
  print(sabores.length);

  var menu1 = ['cheesecake', 'brownie'];
  var menu2 = ['tiramisu', 'flan'];
  var menuCompleto = [...menu1, ...menu2];
  print(menuCompleto);

  bool incluirEspecial = true;
  var menuDia = [
    'cheesecake',
    'brownie',
    if (incluirEspecial) 'pastel de chocolate',
  ];
  print(menuDia);

  var cantidades = [for (var i = 1; i <= 5; i++) i * 10];
  print(cantidades);

  print(postres);
  print(precios);
  print(inventario);
  print(sabores);
}