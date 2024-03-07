_ = readLine()
let A = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let B = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

func isContaining(_ x: Int) -> Bool {
    var start = 0
    var end = B.count - 1
    var mid: Int { (start + end) / 2 }

    while start <= end {
        if B[mid] < x {
            start = mid + 1
        } else if B[mid] > x {
            end = mid - 1
        } else {
            return true
        }
    }

    return false
}

var result: [Int] = []

A.forEach {
    if !isContaining($0) { result.append($0) }
}

if result.count == 0 { print(0) }
else { print("\(result.count)\n\(result.map(String.init).joined(separator: " "))") }