fun main() {

    println("Funciones - Parametros por defecto")

    println(crearPedido("Pizza Familiar", 2, "Mesa"))
    println(crearPedido("Hamburguesa"))
    println(crearPedido("Ensalada", 3))
    println(crearPedido("Tacos", 4, "Para llevar"))

    // Argumentos nombrados
    println(
        crearPedido(
            cantidad = 5,
            plato = "Pasta Alfredo",
            confirmado = false
        )
    )
}

fun crearPedido(
    plato: String,
    cantidad: Int = 1,
    tipoEntrega: String = "Mesa",
    confirmado: Boolean = true
): String {

    return "Pedido[plato=$plato, cantidad=$cantidad, tipoEntrega=$tipoEntrega, confirmado=$confirmado]"
}