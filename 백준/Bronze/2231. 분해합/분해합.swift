let input = readLine()!
let n = Int(input)!, digitCount = input.count
var minGenerator = 0

for digitSum in 0...digitCount * 9 {
    let m = n - digitSum
    let digitNumbers = String(m).compactMap { Int(String($0)) }
    if n == m + digitNumbers.reduce(0, +) {
        minGenerator = m
    }
}

print(minGenerator)