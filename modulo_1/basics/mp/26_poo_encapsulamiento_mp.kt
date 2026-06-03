class MesaRestaurante(numero: Int, consumoInicial: Double) {

    val numeroMesa: Int = numero

    private var totalCuenta: Double = consumoInicial

    internal val codigoMesa: String =
        "M${(100..999).random()}"

    protected open fun calcularPropina(): Double =
        totalCuenta * 0.10

    fun agregarConsumo(monto: Double) {
        require(monto > 0) { "El consumo debe ser positivo" }

        totalCuenta += monto

        println(
            "Consumo agregado: $${"%.2f".format(monto)} | Total: ${consultarCuenta()}"
        )
    }

    fun pagar(monto: Double): Boolean {

        require(monto > 0) { "El pago debe ser positivo" }

        if (monto > totalCuenta) {
            println("El pago excede el valor de la cuenta")
            return false
        }

        totalCuenta -= monto

        println(
            "Pago realizado: $${"%.2f".format(monto)} | Saldo pendiente: ${consultarCuenta()}"
        )

        return true
    }

    fun consultarCuenta(): String =
        "$${"%.2f".format(totalCuenta)}"
}

fun main() {

    val mesa = MesaRestaurante(5, 50.0)

    mesa.agregarConsumo(20.0)
    mesa.agregarConsumo(15.0)

    mesa.pagar(30.0)

    mesa.pagar(100.0)

    println("Mesa: ${mesa.numeroMesa}")
    println("Cuenta actual: ${mesa.consultarCuenta()}")
}