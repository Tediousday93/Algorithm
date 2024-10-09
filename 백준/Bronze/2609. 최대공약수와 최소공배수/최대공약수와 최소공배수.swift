func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}

let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = ab[0], b = ab[1]
let GCD = gcd(a, b)

print("\(GCD)\n\(a / GCD * b)")