_ = readLine()
let abilityPoints = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var ans: Int = 0

func lowerIndex(of x: Int, start: Int) -> Int {
    var start = start
    var end = abilityPoints.count

    while start < end {
        let mid = (start + end) / 2

        if abilityPoints[mid] >= x {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

func upperIndex(of x: Int, start: Int) -> Int {
    var start = start
    var end = abilityPoints.count

    while start < end {
        let mid = (start + end) / 2

        if abilityPoints[mid] > x {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

for i in stride(from: 0, through: abilityPoints.count - 2, by: 1) {
    for j in stride(from: i+1, through: abilityPoints.count - 1, by: 1) {
        let target = -(abilityPoints[i] + abilityPoints[j])
        let lowerIndex = lowerIndex(of: target, start: j+1)
        let upperIndex = upperIndex(of: target, start: j+1)
        ans += upperIndex - lowerIndex
    }
}

print(ans)