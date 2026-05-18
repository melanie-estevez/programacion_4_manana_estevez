fun main() {
    println("Controles de Flujo When")
    println("Ingrese el codigo del tipo de muestra")
    val codigo = readLine()?.toIntOrNull()?:0
    val especialidad = when(codigo){
        1 ->"Sangre venenosa | 4(h)"
        2 ->"Orina | 2(h)"
        3 ->"Heces | 24(h)"
        4 ->"Hisopado nasofaringeo | 4(h)"
        5 ->"Biopsia | 72(h)"
        else ->"Tipo de muestra no registrada"
    }
    println("Especialidad: $especialidad")
}