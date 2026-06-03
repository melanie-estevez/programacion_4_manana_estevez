fun main() {

    println("Listas - Restaurante")

    val platos = listOf(
        "Pizza",
        "Hamburguesa",
        "Ensalada",
        "Hamburguesa",
        "Pasta"
    )

    println("Cantidad de platos: ${platos.size}")
    println("Plato indice 0: ${platos[0]}")
    println("Primer plato: ${platos.first()}")
    println("Último plato: ${platos.last()}")

    println("Plato indice 2: ${platos.get(2)}")
    println("Índice de Hamburguesa: ${platos.indexOf("Hamburguesa")}")
    println("¿Existe Ensalada?: ${platos.contains("Ensalada")}")
    println("¿Existe Pizza?: ${"Pizza" in platos}")

    println("Sublista: ${platos.subList(1, 3)}")
    println("Primeros 2 platos: ${platos.take(2)}")
    println("Omitir los primeros 3 platos: ${platos.drop(3)}")
    println("Últimos 2 platos: ${platos.takeLast(2)}")

    println("\nRecorrido de platos")
    for (plato in platos) {
        println(plato)
    }

    println("\nLista Mutable")

    val mesas = mutableListOf(
        "Mesa 1",
        "Mesa 2",
        "Mesa 3",
        "Mesa 4"
    )

    println(mesas)

    mesas.add("Mesa 5")
    println(mesas)

    mesas.add(0, "Mesa VIP")
    println(mesas)

    mesas.remove("Mesa 5")
    println(mesas)

    mesas[1] = "Mesa Reservada"
    println(mesas)

    println("\nArrayDeque")

    val colaPedidos = ArrayDeque<String>()

    println(colaPedidos)

    colaPedidos.addFirst("Pizza")
    println(colaPedidos)

    colaPedidos.addLast("Hamburguesa")
    println(colaPedidos)

    colaPedidos.addLast("Pasta")
    println(colaPedidos)

    colaPedidos.removeFirst()
    println(colaPedidos)

    colaPedidos.removeLast()
    println(colaPedidos)
}