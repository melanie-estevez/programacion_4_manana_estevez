void main() {

  for (int anio = 2000; anio <= 2025; anio++) {

    if ((anio % 4 == 0 && anio % 100 != 0) || anio % 400 == 0) {
      print("$anio es bisiesto");
    } else {
      print("$anio no es bisiesto");
    }

  }

}