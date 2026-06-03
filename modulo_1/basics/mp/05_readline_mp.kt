fun main() {
    println("Escribe el nombre del plato:")
    val plato = readLine()
    println("Plato ingresado: $plato")

    println("Escribe la categoria del plato:")
    val categoria = readLine() ?: "General" 
    println("Categoria ingresada: $categoria")
}