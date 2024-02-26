let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = mn[0]
let n = mn[1]
var isPrime: [Bool] = .init(repeating: true, count: n+1)
isPrime[0] = false
isPrime[1] = false

var primeNumbers: [Int] = []

var index: Int = 2
while index * index <= n {
    if !isPrime[index] {
        index += 1
        continue
    }

    var multipleIndex = index * index
    while multipleIndex <= n {
        isPrime[multipleIndex] = false
        multipleIndex += index
    }

    index += 1
}

for (number, isPrime) in isPrime.enumerated() {
    if isPrime { primeNumbers.append(number) }
}

let ans = primeNumbers.filter({ (m...n).contains($0) })
.map { String($0) }
.joined(separator: "\n")

print(ans)