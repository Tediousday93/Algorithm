let t = Int(readLine()!)!
var ans = ""
for _ in 0..<t {
    let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
    ans += "\(LCM(ab[0], ab[1]))\n"
}
print(ans)

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return GCD(b, a % b)
}

func LCM(_ a: Int, _ b: Int) -> Int {
    return a / GCD(a, b) * b
}