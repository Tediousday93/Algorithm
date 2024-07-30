let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var notHeared: Set<String> = []
var notSeen: Set<String> = []

for _ in 0..<n {
    notHeared.insert(readLine()!)
}
for _ in 0..<m {
    notSeen.insert(readLine()!)
}

let intersection = notHeared.intersection(notSeen)
var ans = "\(intersection.count)\n"

for name in intersection.sorted() {
    ans += name + "\n"
}

print(ans)