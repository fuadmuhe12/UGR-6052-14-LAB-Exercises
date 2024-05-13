fun analyzeString(input: String): Triple<Int, Int, Int> {
    var wordCount = 0
    var uppercaseCount = 0
    var vowelCount = 0

    for (char in input) {
        if (char.isLetter()) {
            if (char.isUpperCase()) {
                uppercaseCount++
            }
            if (char.toLowerCase() in listOf('a', 'e', 'i', 'o', 'u')) {
                vowelCount++
            }
        } else if (char == ' ') {
            wordCount++
        }
    }

    wordCount++

    return Triple(wordCount, uppercaseCount, vowelCount)
}

fun main() {
    val input = "Hello, World! This is a Sample String for Analysis."
    val (wordCount, uppercaseCount, vowelCount) = analyzeString(input)
    println("Number of words: $wordCount")
    println("Number of uppercase letters: $uppercaseCount")
    println("Number of vowels: $vowelCount")
}
