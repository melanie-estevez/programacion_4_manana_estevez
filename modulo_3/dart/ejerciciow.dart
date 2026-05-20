import 'dart:io';
void main() {
    int suma = 0;
    int cantidad = 0;
    int piezas= 1;
    while(piezas > 0){ 
        print("Ingrese la cantidad de piezas: ");
        int piezas =int.parse(stdin.readLineSync()!);

        if (piezas == 0){
            break;
        }
        cantidad ++;
        suma += cantidad;
    };
    
    print ("La cantidad de piezas ingresadas es: $suma");
    if (suma < 50){
        print("Produccion baja");
    }else{    
        print("Produccion adecuada");
    };
}