fun main() {
    println("Operadores Logicos")

    val hay_stock = true
    val cliente_vip = false
    val restaurante_abierto = true

    println("&& - AND logico")
    println("$hay_stock && $cliente_vip = ${hay_stock && cliente_vip} (hay stock y es VIP)")
    println("$restaurante_abierto && $hay_stock = ${restaurante_abierto && hay_stock} (abierto y disponible)")

    println("|| - OR logico")
    println("$hay_stock || $cliente_vip = ${hay_stock || cliente_vip} (hay stock o es VIP)")
    println("$restaurante_abierto || $cliente_vip = ${restaurante_abierto || cliente_vip}")

    println("! - NOT")
    println("!$hay_stock = ${!hay_stock} (no hay stock)")
    println("!$restaurante_abierto = ${!restaurante_abierto} (cerrado)")
}