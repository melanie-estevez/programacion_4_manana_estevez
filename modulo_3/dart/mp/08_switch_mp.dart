void main() {
  String estadoPedido = 'LISTO';

  switch (estadoPedido) {
    case 'RECIBIDO':
      print('Pedido recibido');
    case 'PREPARANDO':
      print('Postre en preparacion');
    case 'LISTO':
      print('Listo para entregar');
    case 'ENTREGADO':
      print('Pedido entregado');
    case 'CANCELADO':
      print('Pedido cancelado');
    default:
      print('Estado desconocido');
  }

  String descripcion = switch (estadoPedido) {
    'RECIBIDO' => 'Pedido registrado',
    'PREPARANDO' => 'El chef prepara el postre',
    'LISTO' => 'Postre listo para entrega',
    'ENTREGADO' => 'Pedido completado',
    'CANCELADO' => 'Pedido anulado',
    _ => 'Estado desconocido',
  };

  print(descripcion);

  int codigoMesa = 4;

  String zona = switch (codigoMesa) {
    1 || 2 || 3 => 'Zona VIP',
    4 || 5 || 6 => 'Zona principal',
    7 || 8 || 9 => 'Terraza',
    _ => 'Zona no asignada',
  };

  print(zona);

  double stock = 12.5;

  String disponibilidad = switch (stock) {
    double s when s >= 20 => 'Stock alto',
    double s when s >= 10 => 'Stock medio',
    double s when s > 0 => 'Ultimas unidades',
    _ => 'Agotado',
  };

  print(disponibilidad);

  Object respuestaSistema = {
    'id': 1,
    'postre': 'Cheesecake',
    'precio': 4.50
  };

  String resultado = switch (respuestaSistema) {
    Map<String, dynamic> m when m.containsKey('error') =>
      'Error: ${m['error']}',
    Map<String, dynamic> m =>
      'Postre: ${m['postre']} - \$${m['precio']}',
    List<dynamic> lista =>
      '${lista.length} postres registrados',
    String texto =>
      'Mensaje: $texto',
    _ =>
      'Respuesta desconocida',
  };

  print(resultado);
}