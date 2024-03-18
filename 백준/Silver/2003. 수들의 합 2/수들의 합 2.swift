let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = nm[1]
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var start = 0
var end = 0
var count = 0
var partialSum = numbers[0]

while end < numbers.count, start <= end {
    switch partialSum {
    case ..<m:
        end += 1
        guard end != numbers.count else { break }
        partialSum += numbers[end]
    case m:
        count += 1
        fallthrough
    default:
        if start == end {
            partialSum -= numbers[start]
            start += 1
            end += 1
            guard start < numbers.count else { break }
            partialSum = numbers[start]
            break
        }
        partialSum -= numbers[start]
        start += 1
    }
}

print(count)