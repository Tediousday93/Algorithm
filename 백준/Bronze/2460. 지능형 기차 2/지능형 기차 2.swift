var maxValue = 0
var cur = 0

for _ in 0..<10 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    cur = cur - input[0] + input[1]
    maxValue = max(maxValue, cur)
}

print(maxValue)