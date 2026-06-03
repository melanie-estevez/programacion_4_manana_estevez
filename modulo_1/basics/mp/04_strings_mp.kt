fun main() {
    val plato = "Pizza"
    val categoria = "Italiana"
    val precio = 8

    println("Plato: $plato")

    println("Plato en mayusculas: ${plato.uppercase()} (${categoria.uppercase()})")

    val descripcion = "Plato: ${plato.uppercase()} - ${categoria.uppercase()}"
    println(descripcion)

    println("Precio con impuesto: ${precio + 2} dolares")

    val menu = """
        |Plato: $plato
        |Categoria: $categoria
        |Precio: $precio
        |Estado: ${if (precio > 10) "Premium" else "Economico"}
    """.trimMargin()

    println(menu)
}