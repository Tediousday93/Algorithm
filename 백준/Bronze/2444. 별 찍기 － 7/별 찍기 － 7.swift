let n = Int(readLine()!)!
let total = 2 * n - 1
let star = "*"
let space = " "
var lines: [String] = .init(repeating: "", count: total)
for i in 0..<n-1 {
    let spaceCount = n - i - 1
    let starCount = 2 * (i+1) - 1
    var curLine = String(repeating: space, count: spaceCount) + String(repeating: star, count: starCount)
    lines[i] = curLine
    lines[total - i - 1] = curLine
}
lines[n-1] = String(repeating: "*", count: total)
print(lines.joined(separator: "\n"))