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


Enunciado
Una carpintería registra la cantidad de sillas fabricadas y las horas trabajadas por cada empleado.
Realiza un programa en Dart que use readLineSync() y un ciclo while para ingresar:
Horas trabajadas
Cantidad de sillas fabricadas
Dentro del ciclo, calcular las sillas fabricadas por hora.
Reglas de negocio:
Menos de 2 sillas por hora → “Producción baja”
Entre 2 y 4 sillas por hora → “Producción normal”
Más de 4 sillas por hora → “Producción alta”
El programa debe continuar mientras las horas trabajadas sean mayores a 0.
Al finalizar, mostrar:
Total de sillas fabricadas
Cantidad de empleados registrados
Promedio de sillas por empleado

Enunciado
Un consultorio médico registra la cantidad de pacientes atendidos y las horas trabajadas por cada doctor.
Realiza un programa en Dart que use readLineSync() y un ciclo while para ingresar:
Horas trabajadas
Cantidad de pacientes atendidos
Dentro del ciclo, calcular los pacientes atendidos por hora.
Reglas de negocio:
Menos de 3 pacientes por hora → “Atención lenta”
Entre 3 y 6 pacientes por hora → “Atención normal”
Más de 6 pacientes por hora → “Atención rápida”
El programa debe continuar mientras las horas trabajadas sean mayores a 0.
Al finalizar, mostrar:
Total de pacientes atendidos
Cantidad de doctores registrados
Promedio de pacientes por doctor
