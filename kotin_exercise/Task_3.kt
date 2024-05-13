fun computeLetterGrade(grade: Int): String {
    return when {
        grade >= 90 -> "A"
        grade in 80..89 -> "B"
        grade in 70..79 -> "C"
        grade in 60..69 -> "D"
        else -> "F"
    }
}

fun main() {

    val letterGrade = computeLetterGrade(numericGrade)

    println("Numeric Grade: $numericGrade")
    println("Letter Grade: $letterGrade")
}
