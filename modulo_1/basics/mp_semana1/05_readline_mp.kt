fun main() {
    println("Escribe el nombre del plato:")
    val plato = readLine()
    println("Plato ingresado: $plato")

    println("Escribe la categoría del plato:")
    val categoria = readLine() ?: "General" // Si no escribe nada, toma "General"
    println("Categoría ingresada: $categoria")

    /*
    Comentario multilínea:
    Sirve para explicar varias líneas de código
    */

    // Comentario de una sola línea

    /**
     * Comentario tipo documentación
     * @param plato nombre del plato ingresado
     * @param categoria tipo de comida
     * @return muestra los datos ingresados
     */
}