let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = nm[1]
let treeHeights = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var start = 0
var end = treeHeights.max()!
var mid: Int { (start + end + 1) / 2 }

while start < end {
    var cutSum = 0
    for height in treeHeights {
        if height < mid { continue }
        cutSum += height - mid
    }

    if cutSum >= m {
        start = mid
    } else {
        end = mid - 1
    }
}

print(start)