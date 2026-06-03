enum class EstadoPedido(
    val descripcion: String,
    val finalizado: Boolean
) {

    RECIBIDO(
        "Pedido recibido",
        false
    ),

    PREPARANDO(
        "Pedido en preparacion",
        false
    ),

    ENTREGADO(
        "Pedido entregado al cliente",
        true
    ),

    CANCELADO(
        "Pedido cancelado",
        true
    );

    fun puedeCambiarA(siguiente: EstadoPedido): Boolean =
        when (this) {

            RECIBIDO ->
                siguiente == PREPARANDO ||
                siguiente == CANCELADO

            PREPARANDO ->
                siguiente == ENTREGADO ||
                siguiente == CANCELADO

            else -> false
        }
}

fun main() {

    val estado = EstadoPedido.PREPARANDO

    println(estado.descripcion)
    println(estado.finalizado)

    val estadoTexto = when (estado) {
        EstadoPedido.RECIBIDO -> "RECIBIDO"
        EstadoPedido.PREPARANDO -> "PREPARANDO"
        EstadoPedido.ENTREGADO -> "ENTREGADO"
        EstadoPedido.CANCELADO -> "CANCELADO"
    }

    println(estadoTexto)

    println(
        estado.puedeCambiarA(
            EstadoPedido.ENTREGADO
        )
    )
}