class Plato(
    val id: Int,
    val nombre: String,
    val precio: Double,
    private val cantidadDisponible: Int
) {

    val precioConImpuesto: Double
        get() = precio * 1.15

    val disponible: Boolean
        get() = cantidadDisponible > 0

    override fun toString(): String {
        return "$nombre ($${"%.2f".format(precio)})"
    }
}

fun main() {

    val pizza = Plato(
        1,
        "Pizza Familiar",
        18.50,
        10
    )

    println(pizza.disponible)
    println(pizza.precioConImpuesto)
    println(pizza)
}