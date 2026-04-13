fun main(){
    //Numeros Enteros

    val numero_pedido: Byte=127  // Entero pequeño (-128 a 127)
    println ("Pedido numero: $numero_pedido")
     
    val pedido: Short=31_755
    println("Pedido numero: $pedido")

    val edad_cliente: Int 22
    println("Edad del cliente:$edad_cliente")

    val numero_factura: Long=21_345_654_789_345L
    println("Numero de factura: $numero_factura")

    //Numeros Decimales

    val pago: Float=2.50f
    println("El pago es de $pago")

    val pago_factura: Double:5.152535
    println("El pago total es $pago_factura")


   //Inferido

    val plato = "Hamburguesa"
    val precio = 8.50

    println("Plato: $plato")
    println("Tipo inferido plato: ${plato::class.simpleName}")

    println("Precio: $precio")
    println("Tipo inferido precio: ${precio::class.simpleName}")
}
