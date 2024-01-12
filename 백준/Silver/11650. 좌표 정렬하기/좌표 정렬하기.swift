let n = Int(readLine()!)!
var coordits: [(Int, Int)] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    coordits.append((input[0], input[1]))
}

var ans: String = ""
coordits.sorted { $0.0 == $1.0 ? ($0.1 < $1.1) : ($0.0 < $1.0) }
    .map { "\($0.0) \($0.1)"}
    .forEach { ans += $0 + "\n" }

print(ans)