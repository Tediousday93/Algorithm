let kn = readLine()!.split(separator: " ").compactMap { Int($0) }
let k = kn[0]
let n = kn[1]
var lines: [Int] = []
for _ in 0..<k {
    lines.append(Int(readLine()!)!)
}

var start = 1
var end = lines.max()!
var mid: Int { (start + end + 1) / 2 }

while start < end {
    let lineCount = lines.reduce(0) { $0 + ($1 / mid) }

    if lineCount >= n {
        start = mid
    } else {
        end = mid - 1
    }
}

print(start)