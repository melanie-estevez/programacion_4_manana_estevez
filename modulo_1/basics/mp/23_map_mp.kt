fun main() {

    println("Map Inmutable")

    val menu = mapOf(
        "Pizza" to 12.50,
        "Hamburguesa" to 8.00,
        "Pasta" to 10.00,
        "Ensalada" to 6.50
    )

    println(menu["Pizza"])
    println(menu["Tacos"])

    println(menu.getOrDefault("Pizza", 0.0))
    println(menu.getOrDefault("Tacos", 0.0))

    println(menu)
    println(menu.keys)
    println(menu.values)
    println(menu.entries)

    for ((plato, precio) in menu) {
        println("$plato - $$precio")
    }

    println("\nMap Mutable")

    val inventario = mutableMapOf(
        "Tomates" to 20,
        "Queso" to 15,
        "Pan" to 30,
        "Carne" to 25
    )

    inventario["Lechuga"] = 10
    println(inventario)

    inventario["Tomates"] = 40
    println(inventario)

    inventario.remove("Pan")
    println(inventario)

    inventario.getOrPut("Refrescos") { 50 }
    println(inventario)

    inventario.getOrPut("Queso") { 50 }
    println(inventario)
}