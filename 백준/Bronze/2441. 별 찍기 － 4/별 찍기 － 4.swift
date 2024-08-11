let n = Int(readLine()!)!
let space = " "
let star = "*"

var lines: [String] = []
for i in 0..<n {
    let line = String(repeating: space, count: i) + String(repeating: star, count: n - i)
    lines.append(line)
}
print(lines.joined(separator: "\n"))