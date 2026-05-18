fun main(){
    println("Operadores de Comparacion")

    var precio1 = 10
    var precio2 = 2

    println("$precio1 == $precio2 : ${precio1 == precio2}")
    println("$precio1 equals $precio2 : ${precio1.equals(precio2)}")

    println("$precio1 != $precio2 : ${precio1 != precio2}")

    println("$precio1 > $precio2 : ${precio1 > precio2} (más caro)")
    println("$precio1 < $precio2 : ${precio1 < precio2} (más barato)")

    println("$precio1 >= $precio2 : ${precio1 >= precio2}")
    println("$precio1 <= $precio2 : ${precio1 <= precio2}")
}