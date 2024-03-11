let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = mn[0]
var spaces: [[Int]] = []

for _ in 0..<m {
    spaces.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
}

func compress(arr: [Int]) -> [Int] {
    let unique = Set(arr).sorted()
    return arr.map { element in
                    indexOf(element, in: unique)
                   }
}

func indexOf(_ x: Int, in arr: [Int]) -> Int {
    var start = 0
    var end = arr.count - 1
    var mid: Int { (start + end) / 2 }

    while start <= end {
        if arr[mid] > x {
            end = mid - 1
        } else if arr[mid] < x {
            start = mid + 1
        } else {
            return mid
        }
    }

    return -1
}

spaces = spaces.map { compress(arr: $0) }

var count = 0
while let space = spaces.popLast() {
    spaces.forEach {
        if $0 == space {
            count += 1
        }
    }
}

print(count)