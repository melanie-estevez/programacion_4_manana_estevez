data class Categoria(
    val id: Int,
    val nombre: String
)

data class Plato(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val disponibles: Int,
    val categoria: Categoria,
    val activo: Boolean = true
) {


    val disponible: Boolean
        get() = activo && disponibles > 0

    val precioConIva: Double
        get() = precio * 1.15

    fun aplicarDescuento(porcentaje: Double): Plato {

        require(porcentaje in 0.0..100.0) {
            "El descuento debe estar entre 0 y 100"
        }

        return copy(
            precio = precio * (1 - porcentaje / 100)
        )
    }
}

object MenuRestaurante {

    private val categorias = mutableListOf(
        Categoria(1, "Entradas"),
        Categoria(2, "Platos Principales"),
        Categoria(3, "Postres"),
        Categoria(4, "Bebidas")
    )

    private val platos = mutableListOf<Plato>()

    private var siguienteId = 1

    fun agregarPlato(
        nombre: String,
        precio: Double,
        disponibles: Int,
        categoriaId: Int
    ): Plato? {

        val categoria =
            categorias.find { it.id == categoriaId }
                ?: return null

        val plato = Plato(
            siguienteId++,
            nombre,
            precio,
            disponibles,
            categoria
        )

        platos.add(plato)

        return plato
    }

    fun listar(): List<Plato> =
        platos.toList()

    fun disponibles(): List<Plato> =
        platos.filter { it.disponible }

    fun porCategoria(id: Int): List<Plato> =
        platos.filter { it.categoria.id == id }

    fun buscar(texto: String): List<Plato> =
        platos.filter {
            it.nombre.contains(texto, ignoreCase = true)
        }
}

fun main() {

    MenuRestaurante.agregarPlato(
        "Ensalada Cesar",
        7.50,
        10,
        1
    )

    MenuRestaurante.agregarPlato(
        "Pizza Familiar",
        18.00,
        8,
        2
    )

    MenuRestaurante.agregarPlato(
        "Hamburguesa Especial",
        12.00,
        0,
        2
    )

    MenuRestaurante.agregarPlato(
        "Cheesecake",
        5.50,
        6,
        3
    )

    MenuRestaurante.agregarPlato(
        "Limonada",
        3.00,
        15,
        4
    )

    println("=== Menu Completo ===")

    MenuRestaurante.listar().forEach { plato ->

        val estado =
            if (plato.disponible) "✅"
            else "❌"

        println(
            "$estado ${plato.nombre} - $${"%.2f".format(plato.precioConIva)} (IVA incluido)"
        )
    }

    println("=== Platos Disponibles con 10% de Descuento ===")

    MenuRestaurante.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach {
            println(
                "${it.nombre}: $${"%.2f".format(it.precio)}"
            )
        }
}