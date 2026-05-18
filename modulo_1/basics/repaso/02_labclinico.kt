fun main(){
    var normales = 0
    for (i in 1..5){
        println("Glucosa del paciente $i: ")
        val glucosa = readLine()?.toIntOrNull()?: 0
        when {
            glucosa < 70 -> println ("Baja")
            glucosa >= 70 && glucosa <=99 -> {
                println("Normal")
                normales ++
            }
            glucosa >=100 && glucosa >=125 -> println("Prediabetes")
            else -> println("Diabetes")
        }
    }
    println("Los pacientes en estado normal son $normales")
}