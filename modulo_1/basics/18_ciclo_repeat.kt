fun main() {
    println("Controles de Flujo Iteraciones - Repeat")

    val mediciones = 6
    var totalTemperatura = 0
    var totalFiebres = 0

    repeat(mediciones) { i ->
        println("Temperatura ${i + 1}:")
        val temperatura = readLine()?.toDoubleOrNull() ?: 0.0

        totalTemperatura += temperatura.toInt()

        if (temperatura >= 38.5) {
            totalFiebres += 1
        }
    }

    val promedio = totalTemperatura / mediciones
    println("Promedio: $promedio")

    if (totalFiebres > 2) {
        println("Si hubo fiebre sostenida")
    }
}