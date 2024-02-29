var isPrime: [Bool] = .init(repeating: true, count: 123456 * 2 + 1)
isPrime[0] = false
isPrime[1] = false

while let input = readLine(), input != "0" {
    let n = Int(input)!

    var index: Int = 2
    while index * index < 2*n {
        if !isPrime[index] {
            index += 1
            continue
        }

        for i in stride(from: index * index, through: 2*n, by: index) {
            isPrime[i] = false
        }
        index += 1
    }

    var primeCount: Int = 0

    (n+1...2*n).forEach {
        if isPrime[$0] { primeCount += 1 }
    }

    print(primeCount)
}