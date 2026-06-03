fun main() {

    println("Set - Restaurante")

    val platos = setOf(
        "Pizza",
        "Hamburguesa",
        "Pasta",
        "Pizza",
        "Ensalada",
        "Hamburguesa"
    )

    println("Platos del menu: $platos")

    println("\nOperaciones de conjuntos")

    val bebidas = setOf(
        "Gaseosa",
        "Jugo",
        "Agua",
        "Cafe"
    )

    val promocion = setOf(
        "Pizza",
        "Hamburguesa",
        "Agua",
        "Cafe"
    )

    println("Bebidas: $bebidas")
    println("Promocion: $promocion")

    println("Union: ${bebidas union promocion}")
    println("Interseccion: ${bebidas intersect promocion}")
    println("Diferencia: ${bebidas subtract promocion}")

    println("\nSet Mutable")

    val estadosPedido = mutableSetOf(
        "Pendiente",
        "Preparando",
        "Entregado"
    )

    println(estadosPedido)

    estadosPedido.add("Pendiente")
    println(estadosPedido)

    estadosPedido.add("Cancelado")
    println(estadosPedido)

    estadosPedido.remove("Preparando")
    println(estadosPedido)

    println("¿Existe 'Entregado'? ${"Entregado" in estadosPedido}")
    println("¿Existe 'Preparando'? ${"Preparando" in estadosPedido}")
}