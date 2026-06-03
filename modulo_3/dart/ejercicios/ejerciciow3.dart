import 'dart:io';

void main(){
    int cantidad = 0;
    int horas = 1;
    double siho = 0.0;
    int suma = 0;
    double promedio = 0.0;
    int sum = 0;
    int empleados= 0;
    while(horas > 0){
        print("Ingrese las horas trabajadas : ");
        int horas = int.parse(stdin.readLineSync()!);
        print("Ingrese la cantidad de sillas fabricadas: ");
        int cantidad = int.parse(stdin.readLineSync()!);
        if ( horas==0){
            break;
        }
        cantidad++;
        empleados++;
        suma += horas;
        siho = (suma/cantidad);
        if (siho < 2.0){
            print("Produccion baja");
        }else if(siho < 4.0){
            print("Produccion normal");
        }else{
            print("Produccion alta");
        }
        sum += cantidad;
        promedio = (sum/empleados);
    }
    print("Total sillas fabricadas: $cantidad");
    print("Cantidad de empleados: $empleados");
    print("Promedio de sillas por empleados:$promedio");

}


