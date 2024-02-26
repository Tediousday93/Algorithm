let _ = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

func isPrime(_ number: Int) -> Bool {
    guard number != 1 else { return false }

    var dividing: Int = 2
    while dividing * dividing <= number {
        if number % dividing == 0 { return false }
        dividing += 1
    }

    return true
}

print(numbers.filter(isPrime(_:)).count)