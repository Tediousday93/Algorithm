let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = mn[0]
let snacks: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var start = 0
var end = snacks.max()!
var mid: Int { (start + end + 1) / 2 }

while start < end {
    let snackCount = snacks.reduce(0) { $0 + ($1 / mid) }
    if snackCount >= m {
        start = mid
    } else {
        end = mid - 1
    }
}

print(start)