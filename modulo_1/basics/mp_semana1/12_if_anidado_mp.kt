fun main() {
    println("Controles de flujo")
    println("Condicional If - Anidado")

    println("¿Cliente VIP? s/n:")
    val cliente_vip = readLine()?.trim()?.lowercase() == "s"

    println("Ingrese el precio del plato:")
    val precio_plato = readLine()?.toIntOrNull() ?: 0

    if (cliente_vip) {
        println("Cliente VIP")
        if (precio_plato < 10) {
            println("Plato económico con beneficio VIP")
        } else if (precio_plato > 25) {
            println("Plato premium con atención especial")
        } else {
            println("Plato normal con descuento VIP")
        }
    } else {
        println("Cliente regular")
        if (precio_plato < 10 || precio_plato > 25) {
            println("Plato fuera del rango estándar")
        } else {
            println("Plato dentro del rango normal")
        }
    }
}