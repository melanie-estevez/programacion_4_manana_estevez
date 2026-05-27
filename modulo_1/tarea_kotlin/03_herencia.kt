open class Vehiculo(
    val marca: String,
    val modelo: String,
    val anio: Int
) {

    open fun mostrarDatos() {
        println("Marca: $marca")
        println("Modelo: $modelo")
        println("Año: $anio")
    }
}

class Auto(
    marca: String,
    modelo: String,
    anio: Int,
    val numeroPuertas: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("\n=== Datos del Auto ===")
        println("Marca: $marca")
        println("Modelo: $modelo")
        println("Año: $anio")
        println("Número de puertas: $numeroPuertas")
    }
}

class Motocicleta(
    marca: String,
    modelo: String,
    anio: Int,
    val cilindrada: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("\n=== Datos de la Motocicleta ===")
        println("Marca: $marca")
        println("Modelo: $modelo")
        println("Año: $anio")
        println("Cilindrada: $cilindrada cc")
    }
}

fun main() {

    print("Ingrese la marca del auto: ")
    val marcaAuto = readLine()!!

    print("Ingrese el modelo del auto: ")
    val modeloAuto = readLine()!!

    print("Ingrese el año del auto: ")
    val anioAuto = readLine()!!.toInt()

    print("Ingrese el número de puertas: ")
    val puertas = readLine()!!.toInt()

    val auto = Auto(marcaAuto, modeloAuto, anioAuto, puertas)

    print("\nIngrese la marca de la motocicleta: ")
    val marcaMoto = readLine()!!

    print("Ingrese el modelo de la motocicleta: ")
    val modeloMoto = readLine()!!

    print("Ingrese el año de la motocicleta: ")
    val anioMoto = readLine()!!.toInt()

    print("Ingrese la cilindrada: ")
    val cilindrada = readLine()!!.toInt()

    val moto = Motocicleta(marcaMoto, modeloMoto, anioMoto, cilindrada)

    auto.mostrarDatos()
    moto.mostrarDatos()
}