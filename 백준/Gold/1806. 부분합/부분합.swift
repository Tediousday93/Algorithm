let ns = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = ns[0]
let s = ns[1]
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

var start = 0
var end = 0
var sum = numbers[start]
var minLength = Int.max

while start < n {
    while end < n && sum < s {
        end += 1
        if end != n { sum += numbers[end] }
    }
    if end == n { break }
    minLength = min(minLength, end - start + 1)
    sum -= numbers[start]
    start += 1
}

if minLength == Int.max { minLength = 0 }
print(minLength)