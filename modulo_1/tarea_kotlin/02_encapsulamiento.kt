class ProductoInventario(
    val codigo: String,
    val nombre: String,
    private var precio: Double,
    private var stock: Int
) {

    fun consultarPrecio(): Double {
        return precio
    }

    fun consultarStock(): Int {
        return stock
    }

    fun aumentarStock(cantidad: Int) {
        if (cantidad > 0) {
            stock += cantidad
            println("Stock actualizado: $stock")
        }
    }

    fun disminuirStock(cantidad: Int) {
        if (cantidad > 0 && stock - cantidad >= 0) {
            stock -= cantidad
            println("Stock actualizado: $stock")
        } else {
            println("Error: stock insuficiente.")
        }
    }

    fun cambiarPrecio(nuevoPrecio: Double) {
        if (nuevoPrecio >= 0) {
            precio = nuevoPrecio
            println("Nuevo precio: $$precio")
        } else {
            println("Error: el precio no puede ser negativo.")
        }
    }
}

fun main() {

    print("Ingrese el código del producto: ")
    val codigo = readLine()!!

    print("Ingrese el nombre del producto: ")
    val nombre = readLine()!!

    print("Ingrese el precio del producto: ")
    val precio = readLine()!!.toDouble()

    print("Ingrese el stock inicial: ")
    val stock = readLine()!!.toInt()

    val producto = ProductoInventario(codigo, nombre, precio, stock)

    println("\n=== Información del Producto ===")
    println("Código: ${producto.codigo}")
    println("Nombre: ${producto.nombre}")
    println("Precio: $${producto.consultarPrecio()}")
    println("Stock: ${producto.consultarStock()}")

    print("\nCantidad para aumentar stock: ")
    val aumentar = readLine()!!.toInt()
    producto.aumentarStock(aumentar)

    print("Cantidad para disminuir stock: ")
    val disminuir = readLine()!!.toInt()
    producto.disminuirStock(disminuir)

    print("Ingrese el nuevo precio: ")
    val nuevoPrecio = readLine()!!.toDouble()
    producto.cambiarPrecio(nuevoPrecio)
}