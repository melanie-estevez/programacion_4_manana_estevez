fun main() {

    val plato = Plato("Pizza Familiar", 18.50)

    println("Plato: ${plato.nombre}")
    println("Precio: $${plato.precio}")

    val mesa = Mesa()

    mesa.agregarCliente()
    mesa.agregarCliente()
    mesa.agregarCliente()

    println("Clientes en mesa: ${mesa.numeroPersonas}")

    mesa.vaciarMesa()

    println("Clientes despues de vaciar mesa: ${mesa.numeroPersonas}")

    val pedido = Pedido("abc123")

    println("Codigo del pedido: ${pedido.codigoMayusculas}")
}


class Plato(
    val nombre: String,
    val precio: Double
)


class Mesa(
    var numeroPersonas: Int = 0
) {

    fun agregarCliente() {
        numeroPersonas++
    }

    fun vaciarMesa() {
        numeroPersonas = 0
    }
}


class Pedido(codigo: String) {

    val codigoMayusculas = codigo.uppercase()
}