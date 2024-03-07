_ = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
_ = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").compactMap { Int($0) }

func isContaining(_ x: Int) -> Bool {
    var start = 0
    var end = cards.count - 1
    var mid: Int { (start + end) / 2 }

    while start <= end {
        if cards[mid] < x {
            start = mid + 1
        } else if cards[mid] > x {
            end = mid - 1
        } else {
            return true
        }
    }

    return false
}

var ans = ""
for target in targets {
    if isContaining(target) { ans += "1 "}
    else { ans += "0 "}
}

print(ans)