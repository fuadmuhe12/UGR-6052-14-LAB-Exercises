class BankAccount(
    val accountNumber: String,
    var balance: Double
) {
    fun deposit(amount: Double) {
        balance += amount
    }

    fun withdraw(amount: Double) {
        if (amount > balance) {
            println("Insufficient funds. Withdrawal not processed.")
        } else {
            balance -= amount
        }
    }

    fun printBalance() {
        println("Current balance: $balance")
    }
}

fun main() {
    val account = BankAccount("1234567890", 1000.0)

    account.deposit(500.0)
    account.printBalance()

    account.withdraw(200.0)
    account.printBalance()

    account.withdraw(2000.0)
}
