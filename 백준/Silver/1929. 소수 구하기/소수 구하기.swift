let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = mn[0]
let n = mn[1]
var isPrime: [Bool] = .init(repeating: true, count: n+1)
isPrime[0] = false
isPrime[1] = false

var index: Int = 2
while index * index <= n {
    if !isPrime[index] {
        index += 1
        continue
    }

    for multipleIndex in stride(from: index * index, through: n, by: index) {
        isPrime[multipleIndex] = false
    }

    index += 1
}

var ans = ""
for number in m...n {
    if isPrime[number] { ans += String(number) + "\n" }
}
print(ans)