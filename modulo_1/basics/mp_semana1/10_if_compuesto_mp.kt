fun main() {
    println("Controles de flujo")
    println("Condicional If - else")

    println("¿Cliente VIP? s/n:")
    val cliente_vip = readLine()?.trim()?.lowercase() == "s"

    println("Precio del plato:")
    val precio_base = readLine()?.toDoubleOrNull() ?: 10.0

    if (cliente_vip) {
        val descuento = precio_base * 0.80
        println("Precio con descuento VIP: $${"%.2f".format(descuento)}")
    } else {
        println("Precio normal: $${"%.2f".format(precio_base)}")
    }
}