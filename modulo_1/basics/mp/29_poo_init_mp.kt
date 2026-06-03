class Usuario(val nombre: String, val email: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        require(nombre.isNotBlank()) { "El nombre no puede estar vacio" }
        require(email.contains("@")) { "Email invalido: $email" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail      = email.substringAfter("@")
    }
}

fun main() {
    val u = Usuario("  Ana Garcia  ", "ana@kotlin.dev")
    println(u.nombreNormalizado)  
    println(u.dominioEmail)       
}