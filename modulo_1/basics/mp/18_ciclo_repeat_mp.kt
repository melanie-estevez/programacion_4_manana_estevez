fun main() {

    println("Controles de Flujo Iteraciones - Repeat")

    val pedidos = 6
    var totalVentas = 0.0
    var pedidosGrandes = 0

    repeat(pedidos) { i ->

        println("Valor del pedido ${i + 1}:")
        val valorPedido = readLine()?.toDoubleOrNull() ?: 0.0

        totalVentas += valorPedido

        if (valorPedido >= 25.0) {
            pedidosGrandes += 1
        }
    }

    val promedio = totalVentas / pedidos

    println("Ventas totales: $$totalVentas")
    println("Promedio por pedido: $$promedio")

    if (pedidosGrandes > 2) {
        println("Hubo varias ventas altas durante el turno")
    }
}