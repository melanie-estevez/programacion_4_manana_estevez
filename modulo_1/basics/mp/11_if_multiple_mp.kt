fun main() {
    println("Controles de flujo")
    println("Condicional If - Multiples condiciones")

    println("Ingrese el precio del plato:")
    val precio_plato = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (precio_plato <= 5) {
        "Economico"
    } else if (precio_plato <= 10) {
        "Normal"
    } else if (precio_plato <= 15) {
        "Intermedio"
    } else if (precio_plato <= 25) {
        "Gourmet"
    } else if (precio_plato <= 50) {
        "Premium"
    } else {
        "Lujo"
    }

    println("Clasificacion: $clasificacion")
}