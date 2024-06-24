let n = Int(readLine()!)!
let total = 2 * n - 1
let star = "*"
let space = " "
var lines: [String] = .init(repeating: "", count: total)
for i in 0..<n-1 {
    let spaceCount = abs(n - i - 1)
    let starCount = 2 * (i+1) - 1
    var curLine = ""
    for _ in 0..<spaceCount {
        curLine += space
    }
    for _ in 0..<starCount {
        curLine += star
    }
    lines[i] = curLine
    lines[total - i - 1] = curLine
}
lines[n-1] = String(repeating: "*", count: total)
print(lines.joined(separator: "\n"))