fun main(){
    var valor = 1
    var total_vendido= 0
    var mayores = 0
    while(valor!=0){
        println("Ingrese el valor de las  ventas: 0 para terminar")
        valor = readLine()?.toIntOrNull()?: 0
        if (valor !==0 ){
            total_vendido += valor
            if (valor > 100)
            mayores ++
            if (valor > 1000){
                println("Buen dia")
            }else{
                println( "Dia regular")
            }
        }
        
    }
    println("total de ventas: $total_vendido")
    println("Cantidad de ventas altas: $mayores")
}