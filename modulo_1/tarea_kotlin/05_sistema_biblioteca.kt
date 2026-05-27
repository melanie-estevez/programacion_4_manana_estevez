class Libro(
    private val id: Int,
    private val titulo: String,
    private val autor: String,
    private var disponible: Boolean = true
) {

    fun mostrarInformacion() {
        println("ID: $id")
        println("Título: $titulo")
        println("Autor: $autor")
        println("Estado: ${if (disponible) "Disponible" else "Prestado"}")
        println("---------------------------")
    }

    fun prestarLibro() {
        if (disponible) {
            disponible = false
            println("El libro '$titulo' fue prestado.")
        } else {
            println("Error: el libro ya está prestado.")
        }
    }

    fun devolverLibro() {
        if (!disponible) {
            disponible = true
            println("El libro '$titulo' fue devuelto.")
        } else {
            println("Error: el libro ya está disponible.")
        }
    }

    fun estaDisponible(): Boolean {
        return disponible
    }

    fun obtenerTitulo(): String {
        return titulo
    }
}

fun main() {

    val biblioteca = mutableListOf(
        Libro(1, "Cien Años de Soledad", "Gabriel García Márquez"),
        Libro(2, "Don Quijote de la Mancha", "Miguel de Cervantes"),
        Libro(3, "El Principito", "Antoine de Saint-Exupéry")
    )

    while (true) {

        println("\n=== SISTEMA DE BIBLIOTECA ===")
        println("1. Registrar libro")
        println("2. Listar libros disponibles")
        println("3. Prestar libro")
        println("4. Devolver libro")
        println("5. Buscar libro por título")
        println("6. Salir")

        print("Seleccione una opción: ")
        val opcion = readLine()!!.toInt()

        when (opcion) {

            1 -> {
                print("Ingrese ID: ")
                val id = readLine()!!.toInt()

                print("Ingrese título: ")
                val titulo = readLine()!!

                print("Ingrese autor: ")
                val autor = readLine()!!

                biblioteca.add(Libro(id, titulo, autor))

                println("Libro registrado correctamente.")
            }

            2 -> {
                println("\n=== LIBROS DISPONIBLES ===")

                for (libro in biblioteca) {
                    if (libro.estaDisponible()) {
                        libro.mostrarInformacion()
                    }
                }
            }

            3 -> {
                print("Ingrese el título del libro a prestar: ")
                val titulo = readLine()!!

                var encontrado = false

                for (libro in biblioteca) {
                    if (libro.obtenerTitulo().equals(titulo, ignoreCase = true)) {
                        libro.prestarLibro()
                        encontrado = true
                    }
                }

                if (!encontrado) {
                    println("Libro no encontrado.")
                }
            }

            4 -> {
                print("Ingrese el título del libro a devolver: ")
                val titulo = readLine()!!

                var encontrado = false

                for (libro in biblioteca) {
                    if (libro.obtenerTitulo().equals(titulo, ignoreCase = true)) {
                        libro.devolverLibro()
                        encontrado = true
                    }
                }

                if (!encontrado) {
                    println("Libro no encontrado.")
                }
            }

            5 -> {
                print("Ingrese el título a buscar: ")
                val titulo = readLine()!!

                var encontrado = false

                for (libro in biblioteca) {
                    if (libro.obtenerTitulo().equals(titulo, ignoreCase = true)) {
                        libro.mostrarInformacion()
                        encontrado = true
                    }
                }

                if (!encontrado) {
                    println("Libro no encontrado.")
                }
            }

            6 -> {
                println("Saliendo del sistema...")
                break
            }

            else -> {
                println("Opción inválida.")
            }
        }
    }
}