let n = Int(readLine()!)!
var coordinates: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    coordinates.append((input[0], input[1]))
}
coordinates.sort { $0.y != $1.y ? $0.y < $1.y : $0.x < $1.x }

var ans = ""
coordinates.forEach { ans += "\($0.x) \($0.y)\n" }
print(ans)