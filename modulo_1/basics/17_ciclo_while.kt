fun main(){
    println("Controles de Flujo iteraciones. Ciclos repetitivos-Ciclos While")

    var contador = 1
    while(contador<=5){
        println(contador)
        contador++;
    }
    
    println("Do While")
    var contador = 1
    do{
        println(contador)
        contador++;
    }while(contador <= 5)
    
    println("break, continue")
    contador = 1
    while(contador <= 10){
        contador ++;
        if(contador == 3)continue
        if(contador == 7)break
        println(contador)
    }
    
    var input:String
    while(true){
        println("Escribe 'salir' para terminar:")
        input=readLine()?:""
        if (input=="salir")break
        println("usted ingreso: $input")
    }
    

    
    var codigo: Int
    while(true){
        println("Escriba codigo")
        codigo = readLine()?.toIntOrNull()?:0
        when(codigo){
            1-> {
              println("saludar")
            }
            2->{
             println("sumar")
            }
            3->{
              println("tabla")
            }
            else -> {
              println("salir")
              break
            }
        }
    }
}

fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo Repeat")
    println("Cuantas pulsaciones tomar para calcular frecuencia cardiaca")
    
    val mediciones = readLine()?.toIntOrNull() ?: 0
    var totalPulsaciones = 0

    repeat(mediciones) { i ->
        println("medicion ${i + 1} (pulsos en 15 seg.)")
        val pulsos = readLine()?.toIntOrNull() ?: 0
        totalPulsaciones += pulsos * 4//para 60 segs.
    }

    if (mediciones > 0) {
        val promedio = totalPulsaciones / mediciones
        println("Frecuencia cardiaca promedio: $promedio lpm")
        println("Clasificacion: ${
            when {
                promedio < 60 -> "Bradicardia"
                promedio <= 100 -> "Normal"
                else -> "Taquicardia"
            }
        }")
    } else {
        println("No se ingresaron mediciones válidas.")
    }
}