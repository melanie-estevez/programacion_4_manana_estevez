fun main() {

    println("Sistema de Restaurante - Ciclos For")

    println("For con rango")
    for (i in 1..10) {
        println("Mesa $i")
    }

    println("For con until")
    for (i in 1 until 5) {
        println("Pedido #$i")
    }

    println("For con pasos")
    for (i in 1..10 step 2) {
        println("Mesa impar: $i")
    }

    println("For descendente")
    for (i in 10 downTo 1) {
        println("Cerrando mesa $i")
    }

    println("For con listas")
    val platos = listOf("Pizza", "Hamburguesa", "Ensalada")

    for (plato in platos) {
        println(plato)
    }

    println("For con listas indice y valor")
    for ((indice, plato) in platos.withIndex()) {
        println("$indice -> $plato")
    }

    println("For con break")
    for (i in 1..10) {
        println("Preparando pedido $i")

        if (i == 5) {
            println("Ingrediente agotado")
            break
        }
    }

    println("For con continue")
    for (i in 1..10) {

        if (i == 3) {
            continue
        }

        println("Atendiendo mesa $i")
    }

    println("For con continue y break")
    for (i in 1..10) {

        if (i == 3) continue
        if (i == 7) break

        println("Pedido $i procesado")
    }

    val pedidos = listOf(
        Triple("Pizza Familiar", 25.50, "Entregado"),
        Triple("Hamburguesa Doble", 12.00, "Pendiente"),
        Triple("Ensalada Cesar", 8.75, "Preparando")
    )

    println("Reporte de pedidos")

    for ((posicion, pedido) in pedidos.withIndex()) {

        val (nombre, precio, estado) = pedido

        val alerta = if (estado == "Pendiente") {
            "Atencion"
        } else {
            "OK"
        }

        println(
            "Pedido $posicion - $nombre - Precio: $$precio - Estado: $estado ($alerta)"
        )
    }
}