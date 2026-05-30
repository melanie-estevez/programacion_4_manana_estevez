class Libro(
    private val id: Int,
    private val titulo: String,
    private val autor: String,
    private var disponible: Boolean = true
) {

    fun mostrarInformacion() {
        println("id: $id")
        println("Titulo: $titulo")
        println("Autor: $autor")
        println("Estado: ${if (disponible) "Disponible" else "Prestado"}")
    }

    fun prestarLibro() {
        if (disponible) {
            disponible = false
            println("Libro '$titulo' prestado correctamente.")
        } else {
            println("Error: el libro ya esta prestado.")
        }
    }

    fun devolverLibro() {
        if (!disponible) {
            disponible = true
            println("Libro '$titulo' devuelto correctamente")
        } else {
            println("Error: el libro ya esta disponible.")
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
        Libro(1, "Cien Años de Soledad", "Gabriel Garcia Marquez"),
        Libro(2, "Don Quijote de la Mancha", "Miguel de Cervantes"),
        Libro(3, "El Principito", "Antoine de Saint-Exupery")
    )

    while (true) {
        println("-------SISTEMA DE BIBLIOTECA-------")
        println("1. Registrar libro")
        println("2. Listar libros disponibles")
        println("3. Prestar libro")
        println("4. Devolver libro")
        println("5. Buscar libro por titulo")
        println("6. Salir")

        print("Seleccione una opcion: ")
        val opcion = readLine()!!.toInt()

        when (opcion) {
            1 -> {
                print("Ingrese el id: ")
                val id = readLine()!!.toInt()

                print("Ingrese titulo: ")
                val titulo = readLine()!!

                print("Ingrese autor: ")
                val autor = readLine()!!

                biblioteca.add(Libro(id, titulo, autor))

                println("Libro registrado correctamente.")
            }
            2 -> {
                println("-------LIBROS DISPONIBLES-------")

                for (libro in biblioteca) {
                    if (libro.estaDisponible()) {
                        libro.mostrarInformacion()
                    }
                }
            }
            3 -> {
                print("Ingrese el titulo del libro a prestar: ")
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
                print("Ingrese el titulo del libro a devolver: ")
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
                print("Ingrese el titulo a buscar: ")
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
                println("Sesion Cerrada")
                break
            }

            else -> {
                println("Opcion invalida.")
            }
        }
    }
}