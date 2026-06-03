fun main() {

    println("Sistema de Restaurante - Ciclos While")

    var mesa = 1

    println("Mesas ocupadas")
    while (mesa <= 5) {
        println("Mesa $mesa ocupada")
        mesa++
    }

    println("\nDo While")

    var pedido = 1

    do {
        println("Preparando pedido #$pedido")
        pedido++
    } while (pedido <= 5)

    println("\nBreak y Continue")

    var orden = 1

    while (orden <= 10) {

        orden++

        if (orden == 3) continue // saltar pedido 3
        if (orden == 7) break    // detener proceso

        println("Procesando pedido $orden")
    }

    println("\nRegistro de pedidos")

    var entrada: String

    while (true) {

        println("Ingrese un plato (escriba 'salir' para terminar):")

        entrada = readLine() ?: ""

        if (entrada.lowercase() == "salir") {
            break
        }

        println("Pedido registrado: $entrada")
    }

    println("\nMenu de opciones")

    var opcion: Int

    while (true) {

        println("""
            1. Ver menu
            2. Registrar pedido
            3. Ver ventas
            4. Salir
        """.trimIndent())

        opcion = readLine()?.toIntOrNull() ?: 0

        when (opcion) {
            1 -> println("Mostrando menu...")
            2 -> println("Registrando pedido...")
            3 -> println("Mostrando ventas...")
            else -> {
                println("Saliendo del sistema")
                break
            }
        }
    }
}