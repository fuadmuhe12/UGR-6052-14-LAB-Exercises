fun transformToUppercase(strings: List<String>): List<String> {
    return strings.map { it.toUpperCase() }
}

fun filterNumbersGreaterThan(list: List<Int>, threshold: Int): List<Int> {
    return list.filter { it > threshold }
}

fun calculateSum(numbers: List<Int>): Int {
    var acc : Int =0
    for (item in numbers){
        acc += item
    }
    return acc
}
fun main(){
    val num: List<Int> =  listOf(1,2,3,4,5)
    println(calculateSum(num))
}
