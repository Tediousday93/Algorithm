var numbers: [Int] = []
for i in 1...50 {
    for _ in 0..<i {
        numbers.append(i)
    }
}

let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = ab[0] - 1, b = ab[1] - 1

var sum = 0
for i in a...b {
    sum += numbers[i]
}
print(sum)