let input = readLine()!
let n = Int(input)!, digitCount = input.count
var generator = 0

for digitSum in 0...digitCount * 9 {
    let m = n - digitSum
    let digits = String(m).compactMap { Int(String($0)) }
    if n == m + digits.reduce(0, +) {
        generator = m
    }
}

print(generator)