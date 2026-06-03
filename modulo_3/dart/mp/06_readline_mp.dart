import 'dart:io';

void main() {
  print("Ingrese el nombre del cliente:");
  String? cliente = stdin.readLineSync();
  print("Bienvenido $cliente");

  print("Ingrese el nombre del postre:");
  String? postre = stdin.readLineSync();
  print("Postre seleccionado: $postre");

  print("Ingrese el precio del postre:");
  double precio = double.parse(stdin.readLineSync()!);

  print("Ingrese la cantidad:");
  int cantidad = int.parse(stdin.readLineSync()!);

  double total = precio * cantidad;

  print("Cliente: $cliente");
  print("Postre: $postre");
  print("Cantidad: $cantidad");
  print("Total a pagar: \$${total.toStringAsFixed(2)}");
}