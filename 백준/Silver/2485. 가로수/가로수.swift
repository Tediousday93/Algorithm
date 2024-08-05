let n = Int(readLine()!)!
var intervals: Set<Int> = []
var prev = Int(readLine()!)!
var trees: [Int] = [prev]

for _ in 0..<n-1 {
    let cur = Int(readLine()!)!
    trees.append(cur)
    intervals.insert(cur - prev)
    prev = cur
}

let maxInterval = intervals.reduce(intervals.popFirst()!, GCD)
print((trees.max()! - trees.min()!) / maxInterval + 1 - trees.count)

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return GCD(b, a % b)
}