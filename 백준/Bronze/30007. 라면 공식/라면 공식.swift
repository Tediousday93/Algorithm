let n = Int(readLine()!)!
var ans = ""

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let a = input[0], b = input[1], x = input[2]
    ans += "\(waterAmount(for: a, b, x))\n"
}

print(ans)

func waterAmount(for a: Int, _ b: Int, _ x: Int) -> Int {
    return a * (x - 1) + b
}