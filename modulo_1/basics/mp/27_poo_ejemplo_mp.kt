
class Plato(val nombre: String, val precio: Double)


class Plato2(val nombre: String, val precio: Double) {

    fun mostrarInformacion() =
        "Plato: $nombre - Precio: $$precio"

    fun esPremium() =
        precio >= 15.0
}

fun main() {

    val plato = Plato("Hamburguesa", 8.50)

    println(plato.nombre)
    println(plato.precio)

    val plato2 = Plato2("Pizza Familiar", 18.00)

    println(plato2.mostrarInformacion())
    println(plato2.esPremium())
}