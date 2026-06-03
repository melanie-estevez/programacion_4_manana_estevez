fun main() {

    println("Utilidades List - Restaurante")

    val precios = listOf(5, 8, 10, 12, 15, 18, 20, 22, 25, 30)

    println(precios)

    println("Map")

    val preciosConIva = precios.map { it * 1.15 }
    println(preciosConIva)

    val nombresPlatos = precios.map { "Plato $$it" }
    println(nombresPlatos)

    println("Filter")

    val platosEconomicos = precios.filter { it <= 10 }
    println(platosEconomicos)

    val platosPremium = precios.filter { it > 15 }
    println(platosPremium)

    val premiumPares = precios.filter { it > 15 && it % 2 == 0 }
    println(premiumPares)

    val noPremium = precios.filterNot { it > 15 }
    println(noPremium)

    val mezcla = listOf(
        "Pizza",
        12,
        "Hamburguesa",
        true,
        "Pasta",
        20
    )

    val soloPlatos = mezcla.filterIsInstance<String>()
    println(soloPlatos)

    println("Reduce")

    val ventas = listOf(10, 20, 15, 25, 30)

    val totalVentas = ventas.reduce { acc, venta ->
        acc + venta
    }
    println(totalVentas)

    val ventaAcumulada = ventas.fold(100) { acc, venta ->
        acc + venta
    }
    println(ventaAcumulada)

    println("Ordenacion")

    println("Ascendente: ${precios.sorted()}")
    println("Descendente: ${precios.sortedDescending()}")
    println("SortedBy: ${precios.sortedBy { -it }}")

    println("Agregacion")

    println("Total menu: ${precios.sum()}")
    println("Precio promedio: ${precios.average()}")
    println("Precio minimo: ${precios.min()}")
    println("Precio maximo: ${precios.max()}")
    println("Platos mayores a \$15: ${precios.count { it > 15 }}")

    println("Busqueda")

    println("Primer plato > 15: ${precios.find { it > 15 }}")
    println("Último plato > 15: ${precios.findLast { it > 15 }}")
    println("¿Existe un plato > 15?: ${precios.any { it > 15 }}")
    println("¿Todos los platos > 15?: ${precios.all { it > 15 }}")
    println("¿Ningun plato > 15?: ${precios.none { it > 15 }}")
}