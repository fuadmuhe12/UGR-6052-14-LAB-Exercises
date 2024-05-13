fun calculateResult(number1: Double, number2: Double, operation: Char): Double {
    return when (operation) {
        '+' -> number1 + number2
        '-' -> number1 - number2
        '*' -> number1 * number2
        '/' -> {
            if (number2 == 0.0) {
                throw IllegalArgumentException("Cannot divide by zero.")
            }
            number1 / number2
        }
        else -> throw IllegalArgumentException("Invalid operation.")
    }
}

fun main() {
    val number1 = 10.0
    val number2 = 5.0
    val operation = '*'

    try {
        val result = calculateResult(number1, number2, operation)
        println("Result: $result")
    } catch (e: IllegalArgumentException) {
        println(e.message)
    }
}
