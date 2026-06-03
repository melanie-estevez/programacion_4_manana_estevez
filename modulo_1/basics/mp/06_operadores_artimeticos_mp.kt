fun main(){
    println("Operaciones Aritmeticos")

    val precio1 = 10
    val precio2 = 2

    println("Suma (total de platos)")
    println("$precio1 + $precio2 : ${precio1 + precio2}")

    println("Resta (descuento)")
    println("$precio1 - $precio2 : ${precio1 - precio2}")

    println("Multiplicacion (varias unidades)")
    println("$precio1 * $precio2 : ${precio1 * precio2}")

    println("Division (precio por persona)")
    println("$precio1 / $precio2 : ${precio1 / precio2}")

    println("Modulo (residuo)")
    println("$precio1 % $precio2 : ${precio1 % precio2}")

    println("Operadores de Asignacion Compuesta")

    var total = 10
    total += 5
    println("Total + adicional = $total")

    total -= 3
    println("Total - descuento = $total")

    total *= 2
    println("Total por cantidad = $total")

    total /= 2
    println("Total dividido = $total")

    total %= 2
    println("Residuo total = $total")

    // Incremento o Decremento
    total++
    println("Incremento total $total")

    total--
    println("Decremento total $total")
}