fun main(){
    println("Controles de Flujo iteraciones. Ciclos repetitivos-Ciclos For")
    println("For con rango")
    for (i in 1..10){
        println(i*5)
    }
    
    println("For con until")
    for(i in 1 until 5){
        println(i)
    }
    
    println("For con pasos")
    for(i in 1..10 step 2){
        println(i)
    }
    
    println("For descendente")
    for(i in 10 downTo 1){
        println(i)
    }
    
    println("For con listas")
    val nombres = listOf("Juan", "Maria", "Jose")
    for (nombre in nombres){
        println(nombre)
    }
    
    println("For con listas index valor")
    for ((index, valor) in nombres.withIndex()){
        println("$index->$valor")
    }
    
    println("For con break")
    for(i in 1..10){
        if(1==5){
            break
        }
    }
    
    println("For con continue")
    for( i in 1..10){
        if(i==3){
            continue;
        }
        println("item $i")
    }
    
    println("For con continue")
    for (i in 1..10){
        if(1==3)continue;
        if(1==7)break;
        println("item $i")
    }
    
    val pacientes = listOf(
    Triple("Garcia.M", 37.2, 98),
    Triple("Zambrano.L", 39.1, 94),
    Triple("Torres.M", 40.3, 91),
    )
    for ((posicion, paciente) in pacientes.withIndex()) {
        val (nombre, temperatura, spo2) = paciente
        val alertaTemp = if(temperatura >= 38.0) "Fiebre" else "Normal"
        val alertaSpo2 = if(spo2 < 95) "Bajo" else "Normal"
        println("cama $posicion - $nombre - Temp: $temperatura Gdo.Cent.$alertaTemp - SpO2: $spo2 ($alertaSpo2)")
    }
}