let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = ab[0] < ab[1] ? ab[0] : ab[1]
let b = ab[0] < ab[1] ? ab[1] : ab[0]
print(LCM(a, b))

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return GCD(b,  a % b)
}

func LCM(_ a: Int, _ b: Int) -> Int {
    return a / GCD(a, b) * b
}