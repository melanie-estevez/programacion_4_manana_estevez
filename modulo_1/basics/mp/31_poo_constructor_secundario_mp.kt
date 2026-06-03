class Mesa(val capacidad: Int, val ocupados: Int) {

    val disponibles: Int
        get() = capacidad - ocupados

    val llena: Boolean
        get() = ocupados >= capacidad

    constructor(capacidad: Int) : this(capacidad, 0)

    constructor() : this(4, 0)

    override fun toString(): String {
        return "Mesa(capacidad=$capacidad, ocupados=$ocupados, disponibles=$disponibles)"
    }
}

fun main() {

    val mesa1 = Mesa(6, 4)

    val mesa2 = Mesa(8)

    val mesa3 = Mesa()

    println(mesa1)
    println("¿Llena? ${mesa1.llena}")

    println(mesa2)
    println("¿Llena? ${mesa2.llena}")

    println(mesa3)
    println("¿Llena? ${mesa3.llena}")
}