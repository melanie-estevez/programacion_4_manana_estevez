fun calcularBono(sueldo: Double, anios:Int): Double{
    return when{
        anios < 1 -> sueldo * 0
        anios <=3 -> sueldo * 0.05
        anios <=7 -> sueldo * 0.10
        else -> sueldo * 0.15
    }
}

fun main(){
    println("Ingrese su sueldo: ")
    val sueldo = readLine()?.toDoubleOrNull()?: 0.0
    println("Años de trabajo: ")
    val anios = readLine()?.toIntOrNull()?: 0
    val bono = calcularBono(sueldo, anios)
    println("Bono: $bono")
    val total_pagar = sueldo + bono
    println ("Total a pagar: $total_pagar")
}

fun calcularDescuento(monto: Double): Double{
    return when{
        monto < 100 -> 0.0
        monto <= 500 -> monto * 0.5 
        monto <= 1000 -> monto * 0.10
        else -> monto * 0.15
    }
}
fun main (){
    println("Monto de Compra: ")
    val monto = readLine()?.toDoubleOrNull()?: 0.0
    val descuento = calcularDescuento(monto)
    val total = monto - descuento
    println ("Monto: $$monto")
    println ("Descuento: $$descuento")
    println ("Total a pagar: $$total")
}

fun calcularTarima(kilometros: Double): Double{
    return when{
        kilometros <= 5 -> 2.00
        kilometros <= 15 -> 2.00 + (kilometros - 5) * 0.5
        else -> 7.00 + (kilometros - 15) * 0.3
    }
}
fun main(){
    println("Ingrese los kilometros recorridos: ")
    val kilometros = readLine()?.toDoubleOrNull()?: 0.0
    val tarima = calcularTarima(kilometros)
    println("Km recorridos: $kilometros")
    println("Total a pagar: ${"%.2f".format(tarima)}")
}

fun calcularPagoExtra(horasExtra: Int): Int {
    return when {
        horasExtra <= 10 -> horasExtra * 5
        else -> (10 * 5) + ((horasExtra - 10) * 8)
    }
}

fun main() {
    print("Ingrese horas extra: ")
    val horas = readLine()?.toIntOrNull() ?: 0

    val pago = calcularPagoExtra(horas)

    println("Horas extra: $horas")
    println("Pago adicional: $$pago")
}

fun calcularImpuesto(sueldo:Double):Double{
    return when{
        sueldo < 1000 -> 0.0
        sueldo <=3000 -> sueldo * 0.10
        sueldo <=5000 -> sueldo * 0.15
        else -> sueldo * 0.20
    }
}
fun main(){
    println("Ingrese su sueldo: ")
    val sueldo = readLine()?.toDoubleOrNull()?: 0.0
    val impuesto = calcularImpuesto(sueldo)
    println("Sueldo: $${"%.2f".format(sueldo)}")
    println("Impuesto a pagar: $${"%.2f".format(impuesto)}")
}