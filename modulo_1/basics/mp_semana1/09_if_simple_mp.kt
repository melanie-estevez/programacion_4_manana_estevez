fun main() {
    println("Controles de flujo")
    println("Condicional If")

    println("Ingrese el precio del plato:")
    val precio_plato = readLine()?.toDoubleOrNull() ?: 5.0

    if (precio_plato >= 10.0) {
        println("Plato caro: categoría gourmet")
    }

    if (precio_plato >= 20.0) {
        println("Plato premium: especial del chef")
    }

    println("Precio registrado: $precio_plato dólares")
}