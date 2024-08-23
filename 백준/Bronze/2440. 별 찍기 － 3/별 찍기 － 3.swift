let n = Int(readLine()!)!
let star = "*"
var ans = ""
for i in stride(from: n, to: 0, by: -1) {
    let line = String(repeating: star, count: i)
    ans += "\(line)\n"
}
print(ans)