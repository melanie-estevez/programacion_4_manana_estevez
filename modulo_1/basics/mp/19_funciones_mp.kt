fun main() {

    println("Funciones - Restaurante")

    val mensaje = bienvenida()
    println(mensaje)

    val total = calcularCuenta(15, 8)
    println("Total a pagar: $$total")

    println("Descuento aplicado: $${calcularDescuento(30, 5)}")

    println("Propina sugerida: $${calcularPropina(40, 4)}")

    atenderCliente("Pedro")
}

fun bienvenida(): String {
    return "Bienvenido al Restaurante El Sabor"
}

fun calcularCuenta(platoPrincipal: Int, bebida: Int): Int {
    return platoPrincipal + bebida
}

fun calcularDescuento(total: Int, descuento: Int) = total - descuento

fun calcularPropina(total: Int, porcentaje: Int) = (total * porcentaje) / 100

fun atenderCliente(nombre: String) {
    println("Atendiendo al cliente $nombre")
}