let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var numbers: [Int] = []
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}
numbers.sort()

var ans = Int.max
var start = 0
var end = 0

while start < n-1, end < n {
    let diff = numbers[end] - numbers[start]

    if diff < m {
        end += 1
    } else {
        ans = min(ans, diff)
        start += 1
    }
}

print(ans)