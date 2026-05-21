import 'dart:io';

void main() {

  print("Ingresa un número:");
  int numero = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 5; i++) {
    print("$numero x $i = ${numero * i}");
  }

}