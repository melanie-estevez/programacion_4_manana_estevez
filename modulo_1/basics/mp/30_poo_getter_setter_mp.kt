class Plato(precioBase: Double) {

    var precioBase: Double = precioBase
        set(value) {
            require(value > 0) { "El precio debe ser mayor que cero" }
            field = value
        }

    val precioConIva: Double
        get() = precioBase * 1.15

    val precioConServicio: Double
        get() = precioConIva * 1.10

    val categoria: String
        get() = when {
            precioBase < 5  -> "Economico"
            precioBase < 15 -> "Regular"
            precioBase < 25 -> "Premium"
            else            -> "Gourmet"
        }
}

fun main() {

    val plato = Plato(12.0)

    println("Precio base: $${plato.precioBase}")
    println("Precio con IVA: $${"%.2f".format(plato.precioConIva)}")
    println("Precio con servicio: $${"%.2f".format(plato.precioConServicio)}")
    println("Categoria: ${plato.categoria}")

    plato.precioBase = 30.0

    println("\nNuevo precio: $${plato.precioBase}")
    println("Categoria: ${plato.categoria}")

}