_ = readLine()
let liquidValues = readLine()!.split(separator: " ").compactMap { Int($0) }
var ans: (first: Int, second: Int) = (0, 0)
var distance = Int.max

func lowerNearZeroIndex(for liquid: Int, index: Int) -> Int {
    var start = index+1
    var end = liquidValues.count - 1

    while start < end {
        let mid = (start + end) / 2
        let sum = liquid + liquidValues[mid]

        if sum >= 0 {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

for index in 0..<liquidValues.count - 1 {
    let liquid = liquidValues[index]
    let pairIndex = lowerNearZeroIndex(for: liquid, index: index)

    if index != pairIndex, abs(liquid + liquidValues[pairIndex]) < distance {
        distance = abs(liquid + liquidValues[pairIndex])
        ans = (liquid, liquidValues[pairIndex])
    }
    if pairIndex < liquidValues.count - 1, index != pairIndex+1,
    abs(liquid + liquidValues[pairIndex+1]) < distance {
        distance = abs(liquid + liquidValues[pairIndex+1])
        ans = (liquid, liquidValues[index+1])
    }
    if pairIndex != 0, index != pairIndex-1,
    abs(liquid + liquidValues[pairIndex-1]) < distance {
        distance = abs(liquid + liquidValues[pairIndex-1])
        ans = (liquid, liquidValues[pairIndex-1])
    }
}

print("\(ans.first) \(ans.second)")