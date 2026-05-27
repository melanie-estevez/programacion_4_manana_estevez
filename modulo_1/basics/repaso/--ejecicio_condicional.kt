fun main() {
  println("Controles de flujo")
  println("Condicional If - Anidado")
  println("Control de consultas")
  println("Tiene consulta?:")
  val consulta = readLine()?.trim()?.lowercase()=="s"
  println("Ingrese el estado de su consulta:")
  val estado = readLine()?.trim()?.lowercase()
  if (estado == "agendado"){
      println("Su consulta esta agendada")
  }
  if (estado == "en curso"){
      println("Su consulta esta en curso")
      println("lleva mas de 30 minutos?")
      val tiempo = readLine()?.trim()?.lowercase()
      if (tiempo == "s"){
      println("Consulta extendida")
      }
  }    
  if (estado == "finalizado"){
      println("Su consulta ha sido finalizada")
  }
}