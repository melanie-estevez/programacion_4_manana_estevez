object Restaurante {

    val nombre: String = "La Buena Mesa"
    val mesas: Int = 20

    private val codigoInterno: String = "REST-2026"

    fun informacion() =
        "$nombre - $mesas mesas disponibles"

    fun obtenerCodigo() =
        "Codigo autorizado"
}

class Pedido private constructor(
    val id: Int,
    val cliente: String
) {

    companion object {

        private var contadorPedidos = 0

        fun crear(cliente: String, plato: String): Pedido? {

            if (cliente.isBlank() || plato.isBlank()) {
                return null
            }

            return Pedido(
                ++contadorPedidos,
                cliente.trim()
            )
        }

        const val ESTADO_INICIAL = "Pendiente"
    }

    override fun toString(): String {
        return "Pedido(id=$id, cliente=$cliente)"
    }
}

fun main() {

    println(Restaurante.informacion())


    val pedido = Pedido.crear(
        "Juan Perez",
        "Pizza Familiar"
    )

    println(pedido)

    println(Pedido.ESTADO_INICIAL)
}