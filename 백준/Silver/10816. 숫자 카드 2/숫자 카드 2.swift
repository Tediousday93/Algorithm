_ = readLine()
let cards = readLine()!.split(separator: " ")
.compactMap { Int($0) }
.sorted()
_ = readLine()
let targets = readLine()!.split(separator: " ")
.compactMap { Int($0) }

func lowerIndex(of x: Int) -> Int {
    var start = 0
    var end = cards.count
    var mid: Int { (start + end) / 2 }

    while start < end {
        if cards[mid] >= x { end = mid }
        else { start = mid + 1 }
    }

    return start
}

func upperIndex(of x: Int) -> Int {
    var start = 0
    var end = cards.count
    var mid: Int { (start + end) / 2 }

    while start < end {
        if cards[mid] > x { end = mid }
        else { start = mid + 1 }
    }

    return start
}

var ans = ""
for target in targets {
    ans += String(upperIndex(of: target) - lowerIndex(of: target)) + " "
}
print(ans)