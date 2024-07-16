let input = readLine()!
let n = Int(input)!, digitCount = input.count
var generators: [Int] = []

for digitSum in 0...digitCount * 9 {
    let m = n - digitSum
    let digitNumbers = String(m).compactMap { Int(String($0)) }
    if n == m + digitNumbers.reduce(0, +) {
        generators.append(m)
    }
}

if generators.count != 0 {
    print(generators.min()!)
} else {
    print(0)
}
