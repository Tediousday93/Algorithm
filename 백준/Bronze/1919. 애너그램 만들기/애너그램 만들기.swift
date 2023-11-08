let a = readLine()!.map { String($0) }
let b = readLine()!.map { String($0) }
var occurA: [Int] = .init(repeating: 0, count: 26)
var occurB: [Int] = occurA

for ch in a {
    let index = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar("a").value)
    occurA[index] += 1
}

for ch in b {
    let index = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar("a").value)
    occurB[index] += 1
}

var result: Int = 0

for i in 0...25 {
    result += abs(occurA[i] - occurB[i])
}

print(result)