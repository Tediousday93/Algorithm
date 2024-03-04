let n = Int(readLine()!)!
let targets = readLine()!.split(separator: " ")
.compactMap { Int($0) }
let points = targets.sorted()

var unique: [Int] = [points[0]]
for index in 1..<n {
    if points[index] != points[index - 1] {
        unique.append(points[index])
    }
}

func lowerIndex(of x: Int) -> Int {
    var start = 0
    var end = unique.count
    var mid: Int { (start + end) / 2 }

    while start < end {
        if unique[mid] >= x { end = mid }
        else { start = mid + 1 }
    }

    return start
}

var ans = ""
for target in targets {
    ans += String(lowerIndex(of: target)) + " "
}
print(ans)