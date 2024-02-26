let testCount = Int(readLine()!)!
var ans = ""
for _ in 0..<testCount {
    let mnxy = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = mnxy[0]
    let n = mnxy[1]
    let x = mnxy[2]
    let y = mnxy[3]

    ans += String(getYears(m: m, n: n, x: x, y: y)) + "\n"
}
print(ans)

func getYears(m: Int, n: Int, x: Int, y: Int) -> Int {
    if abs(x - y) % GCD(m, n) != 0 { return -1 }

    let remains = y % n
    let lcm = LCM(m, n)

    for year in stride(from: x, through: lcm, by: m) {
        if year % n == remains { return year }
    }

    return -1
}

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return GCD(b, a % b)
}

func LCM(_ a: Int, _ b: Int) -> Int {
    return a / GCD(a, b) * b
}