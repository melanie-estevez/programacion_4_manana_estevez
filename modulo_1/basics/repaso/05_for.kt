fun main(){
    var subtotal = 0.0
    for (i in 1..3){
        println("Nombre del producto: ")
        val nombre  = readLine()!!
        println("Precio del producto: ")
        val precio = readLine()?.toDoubleOrNull()?: 0.0
        println("Cnatidad del producto: ")
        val cantidad = readLine()?.toIntOrNull()?: 0
        val subtotal = subtotal + (precio*cantidad)
        val descuento = if(subtotal > 100){
            subtotal * 0.10
        }else{
            0.0
        }
        val total = subtotal - descuento
        println("Subtotal: $subtotal")
        println("Descuento: $descuento")
        println("Total: $total")
    }
}

fun main(){
    var urgentes = 0
    for(i in 1..4){
        println("Nombre del producto: ")
        val nombre = readLine()!!
        println ("Stock del producto: ")
        val stock = readLine()?.toIntOrNull()?: 0
        when{
            stock < 5 -> {
               println("Reposicion urgente")
               urgentes ++
            }
            stock <= 10 -> println("Reposicion pronto")
            else -> println("Stock suficiente")
        }
    }
    println("La cantidad de productos que necesitan reposicion urgente es de $urgentes")
}