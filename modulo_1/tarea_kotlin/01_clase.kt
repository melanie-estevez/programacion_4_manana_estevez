class Libro(
    val titulo:String,
    val autor: String,
    val anio: Int,
    val numeroPaginas: Int
){
    fun mostrarInformacion(){
        println("Informacion del Libro")
        println("Titulo: $titulo")
        println("Autos: $autor")
        println("Anio de publicacion: $anio")
        println("Numero de paginas: $numeroPaginas ")
    }
    
    fun determinarAntiguedad(){
        if(anio >= 200){
            println("Estado: El libro $titulo es antiguo, publicado antes del 2000 ")
        }else{
            println("Estado: El libro $titulo es reciente")
        }
    }
}

fun main(){
    println("Registre su libro")
    println("Ingrese el titulo del libro: ")
    val titulo = readLine()!!
    println("Ingrese el nombre del autor: ")
    val autor = readLine()!!
    println("Ingrese el anio de publicacion: ")
    val anio = readLine()?.toIntOrNull()?: 0
    println("Ingrese el numero de paginas")
    val numeroPaginas = readLine()?.toIntOrNull()?: 0
    
    val libroUsuario  =Libro(titulo, autor, anio, numeroPaginas)
    libroUsuario.mostrarInformacion()
    libroUsuario.determinarAntiguedad()
    
}