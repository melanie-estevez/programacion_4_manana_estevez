fun main() {
  println("Controles de flujo")
  println("Condicional If - Anidado")
  println("Frecuencia Cardiaca(lmp)")
  println("Tiene antecedentes cardiacos?")
  val antecedentes = readLine()?.trim()?.lowercase()=="s"
  println("Frecuencia Cardiaca(lpm)")
  val frecuencia = readLine()?.toIntOrNull()?:0
  if (antecedentes){
      println("Paciente con antecedentes cardiacos")
      if(frecuencia<50){
          println("Bradicardia severa")
      }else if(frecuencia>100){
          println("Taquicardia")
      }else{
          println("Frecuencia normal")
      }
  }else{
        println("Pacientes sin antecedentes cardiacos")
        if(frecuencia<50 || frecuencia >100){
          println("Frecuencia fuera del rango normal")
        }else{
          println("Frecuencia Cardiaca normal")
      }
  }
}
