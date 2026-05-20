import 'dart:io';
void main(){
    int empleados = 0;
    int suma = 0;
    int cantidad = 0;
    double promedio = 0.0;
    int cajas = 1;
    

    while (cajas > 0){
        print("Ingrese la cantidad de cajas: ");
        int cajas=int.parse(stdin.readLineSync()!);
        
        if(cajas == 0){
            break;
        }
        cantidad++;
        empleados++;
        suma += cajas;
        promedio = (suma/empleados);

        if(cajas < 20){
        print("Rendimiento bajo");
        }else if(cajas <= 50){
            print("Rendimiento normal");
        }else{
            print("Rendimiento excelente");
        };
    };
    print("Total de cajas empacadas: $suma");
    print("Cantidad de empleados: $empleados");
    print("Promedio de cajas por empleado: $promedio");
    
}