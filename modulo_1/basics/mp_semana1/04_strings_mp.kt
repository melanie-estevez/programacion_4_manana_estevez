fun main() {
    val plato = "Pizza"
    val categoria = "Italiana"
    val precio = 8

    // Variable simple
    println("Plato: $plato")

    // Expresión
    println("Plato en mayúsculas: ${plato.uppercase()} (${categoria.uppercase()})")

    val descripcion = "Plato: ${plato.uppercase()} - ${categoria.uppercase()}"
    println(descripcion)

    println("Precio con impuesto: ${precio + 2} dólares")

    // String Multilínea
    val menu = """
        |Plato: $plato
        |Categoría: $categoria
        |Precio: $precio
        |Estado: ${if (precio > 10) "Premium" else "Económico"}
    """.trimMargin()

    println(menu)
}