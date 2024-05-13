fun convertDistance() {

    when (unit) {
        "kilometers" -> {
            val miles = distance * 0.621371
            println("$distance kilometers is equal to $miles miles.")
        }
        "miles" -> {
            val kilometers = distance * 1.60934
            println("$distance miles is equal to $kilometers kilometers.")
        }
        else -> println("Invalid unit. Please enter either 'kilometers' or 'miles'.")
    }
}

fun main() {
    convertDistance()
}
