fun main() {
    println("Controles de Flujo When")
    println("Ingrese código del plato:")

    val codigo_plato = readLine()?.toIntOrNull() ?: 0

    val plato = when (codigo_plato) {
        1 -> "Hamburguesa"
        2 -> "Pizza"
        3 -> "Ensalada"
        4 -> "Pasta"
        5 -> "Pollo a la brasa"
        6 -> "Sushi"
        else -> "Plato no disponible en el menú"
    }

    println("Plato seleccionado: $plato")
}