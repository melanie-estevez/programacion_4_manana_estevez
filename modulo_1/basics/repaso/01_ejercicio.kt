fun main() {
    var opcion: Int

    var totalServicios = 0
    var montoBruto = 0.0
    var montoNeto = 0.0

    do {
        println("\n--- MENÚ ---")
        println("1. Registrar servicio")
        println("2. Ver resumen")
        println("3. Aplicar descuento")
        println("0. Salir")
        print("Opción: ")

        opcion = readLine()?.toIntOrNull() ?: -1

        when (opcion) {

            1 -> {
                println("\nTipo de servicio:")
                println("1. Consulta")
                println("2. Laboratorio")
                println("3. Imagen")

                val tipo = readLine()?.toIntOrNull() ?: 0

                val precio = when (tipo) {
                    1 -> 20.0
                    2 -> 50.0
                    3 -> 80.0
                    else -> 0.0
                }

                println("Nivel de seguro:")
                println("1. Básico (100%)")
                println("2. Medio (70%)")
                println("3. Alto (50%)")

                val seguro = readLine()?.toIntOrNull() ?: 0

                val copago = when (seguro) {
                    1 -> precio
                    2 -> precio * 0.7
                    3 -> precio * 0.5
                    else -> precio
                }

                totalServicios++
                montoBruto += precio
                montoNeto += copago

                println("Servicio registrado. Copago: $copago")
            }

            2 -> {
                println("\n--- RESUMEN ---")
                println("Total servicios: $totalServicios")
                println("Monto bruto: $montoBruto")
                println("Monto neto: $montoNeto")
            }

            3 -> {
                print("Ingrese código de descuento: ")
                val codigo = readLine()

                print("Ingrese porcentaje: ")
                val porcentaje = readLine()?.toDoubleOrNull() ?: 0.0

                val descuento = montoNeto * (porcentaje / 100)
                montoNeto -= descuento

                println("Descuento aplicado: $descuento")
            }

            0 -> {
                println("\n--- FACTURA FINAL ---")
                println("Total servicios: $totalServicios")
                println("Monto bruto: $montoBruto")
                println("Monto neto final: $montoNeto")
                println("Gracias")
            }

            else -> println("Opción inválida")
        }

    } while (opcion != 0)
}