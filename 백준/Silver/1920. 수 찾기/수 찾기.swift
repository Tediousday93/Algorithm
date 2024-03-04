_ = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

func isContaining(_ x: Int) -> Bool {
    var start = 0
    var end = numbers.count - 1
    var mid: Int { (start + end) / 2 }

    while start <= end {
        if numbers[mid] > x {
            end = mid - 1
        } else if numbers[mid] < x {
            start = mid + 1
        } else {
            return true
        }
    }

    return false
}

_ = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").compactMap { Int($0) }
var ans = ""
for target in targets {
    ans += isContaining(target) ? "1\n" : "0\n"
}
print(ans)