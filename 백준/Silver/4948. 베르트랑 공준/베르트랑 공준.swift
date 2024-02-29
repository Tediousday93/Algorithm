let maximum = 123456
var isPrime: [Bool] = .init(repeating: true, count: maximum * 2 + 1)
isPrime[0] = false
isPrime[1] = false

var index: Int = 2
while index * index < maximum * 2 {
    if !isPrime[index] {
        index += 1
        continue
    }

    for i in stride(from: index * index, through: maximum * 2, by: index) {
        isPrime[i] = false
    }
    index += 1
}

while let input = readLine(), input != "0" {
    let n = Int(input)!
    var primeCount: Int = 0

    (n+1...2*n).forEach {
        if isPrime[$0] { primeCount += 1 }
    }

    print(primeCount)
}