void main() {
  final duplicarPorciones = (int n) => n * 2;
  print(duplicarPorciones(7));

  final calcularTotalConDescuento = (double precio, double pct) {
    final descuento = precio * (pct / 100);
    return precio - descuento;
  };
  print(calcularTotalConDescuento(100.0, 15.0));

  final postres = ['cheesecake', 'brownie', 'tiramisu', 'flan'];

  postres.sort((a, b) => b.compareTo(a));
  print(postres);
}