fun main(){
    println("Ingrese su peso en kg: ")
    val peso = readLine()?.toDoubleOrNull()?: 0.0
    if(peso >= 100){
        println("peso elevado)
    }
    if(peso >=120){
        println("peso critico")
    }
    println("Peso registrado: $peso en libras")
}

fun main(){
    println("Ingrese la velocidad del vehiculo en km/h")
    val velocidad = readLine()?.toIntOrNull()?: 0
    if(velocidad >= 90){
        println("Advertencia:velocidad por encima del limite permitido")
    }else if (velocidad >= 120){
        println("Infraccion grave:reducir velocidad inmediatamente")
    }else{
        println("velocidad dentro del rango")
    }
    println("Velocidad registrada $velocidad km/h")
}

fun main(){
    println("Ingrese su edad:")
    val edad =  readLine()?.toIntOrNull()?: 0
    val clasificacion = if( edad <= 12){
        "Niño"
    }else if (edad <=17){
        "Adolescente"
    }else if (edad <=64){
        "Adulto"
    }else{
        "Adulto Mayor"
    }
    println("La clasificacion segun su edad es $clasificacion .")
    
}

fun main(){
    println("Tiene tarjeta de fidelidad s/n:")
    val tarjeta = readLine()?.trim()?.uppercase()=="S"
    println("Precio normal:")
    val precio_normal = readLine()?.toDoubleOrNull()?: 0.0
    if (tarjeta){
        val descuento = precio_normal * 0.15
        println("Precio con descuento: $descuento")
    }else{
        println("Pago Normal: $precio_normal")
    }
}

fun main(){
    println("Es estudiante s/n: ")
    val estudiante = readLine()?.trim()?.lowercase() == "s"
    println("Costo de matricula: ")
    val matricula = readLine()?.toDoubleOrNull()?: 0.0
    if(estudiante){
        val pago_beneficiario = matricula * 0.50
        println("Pago con beneficiario: $pago_beneficiario")
    }else{
        println("Pago total: $matricula")
    }
}

fun main(){
    println("Es cliente VIP s/n")
    val vip = readLine()?.trim()?.lowercase()=="s"
    println("Total de compra:")
    val total = readLine()?.toDoubleOrNull()?: 0.0
    if(vip){
        val descuento = total * 0.20
        val totalFinal = total - descuento
        println("Total con descuento: $totalFinal")
    }else{
        println("Total a pagar: $total")
    }
}

fun main(){
    println("El cliente cuenta con cupon de descuento? s/n")
    val cupon = readLine()?.trim()?.lowercase() == "s"
    println("Cual es el precio actual de su servicio?")
    val precio_normal = readLine()?.toDoubleOrNull()?: 0.0
    if (cupon){
        val descuento = precio_normal - 10.0
        println("Precio con cupon: $$descuento")
    }else {
        println("Precio sin descuento: $$precio_normal")
    }
}

fun main(){
    println("Tiene suscripcion activa s/n: ")
    val suscripcion = readLine()?.trim()?.lowercase() == "s"
    println("Ingrese el costo mensual: ")
    val mensual = readLine()?.toDoubleOrNull()?: 0.0
    if(suscripcion){
        val descuento = mensual * 0.20
        val total_pagar = mensual - descuento
        println("Pago con suscripcion: $$total_pagar")
    }else{
        println("Pago completo: $$mensual")
    }
}