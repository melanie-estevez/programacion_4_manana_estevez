data class Plato(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val categoria: String,
    val disponible: Boolean = true
)

fun main() {

    val p1 = Plato(
        1,
        "Pizza Familiar",
        18.50,
        "Plato Principal"
    )

    val p2 = Plato(
        1,
        "Pizza Familiar",
        18.50,
        "Plato Principal"
    )

    val p3 = Plato(
        2,
        "Ensalada Cesar",
        7.50,
        "Entrada"
    )

    println(p1)

    println(p1 == p2)
    println(p1 == p3)

    val oferta = p1.copy(precio = 15.00)
    val agotado = p1.copy(disponible = false)

    println(oferta)
    println(agotado)

    val (id, nombre, precio) = p1

    println("$id: $nombre - $$precio")

    listOf(p1, p3).forEach { (id2, nombre2, precio2) ->
        println("[$id2] $nombre2: $$precio2")
    }
}