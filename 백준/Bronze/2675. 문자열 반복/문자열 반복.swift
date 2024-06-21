let T = Int(readLine()!)!
var ans = ""
for _ in 0..<T {
    let RS = readLine()!.split(separator: " ")
    let R = Int(RS[0])!, S = RS[1].map { String($0) }
    var p = ""
    for char in S {
        for _ in 0..<R {
            p += char
        }
    }
    ans += "\(p)\n"
}
print(ans)