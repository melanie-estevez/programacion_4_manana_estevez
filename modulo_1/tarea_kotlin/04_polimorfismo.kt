interface MetodoPago {
    fun procesarPago(monto: Double)
}

class PagoEfectivo : MetodoPago {

    override fun procesarPago(monto: Double) {
        println("Pago en efectivo realizado por $$monto")
    }
}

class PagoTarjeta : MetodoPago {

    override fun procesarPago(monto: Double) {
        println("Pago con tarjeta aprobado por $$monto")
    }
}

class PagoTransferencia : MetodoPago {

    override fun procesarPago(monto: Double) {
        println("Transferencia bancaria realizada por $$monto")
    }
}

fun main() {

    print("Ingrese el monto del pago: ")
    val monto = readLine()!!.toDouble()

    val metodosPago = listOf(
        PagoEfectivo(),
        PagoTarjeta(),
        PagoTransferencia()
    )

    println("  ------------- Procesando Pagos  -------------")

    for (metodo in metodosPago) {
        metodo.procesarPago(monto)
    }
}