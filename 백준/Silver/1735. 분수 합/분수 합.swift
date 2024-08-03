let first = readLine()!.split(separator: " ").compactMap { Int($0) }
let second = readLine()!.split(separator: " ").compactMap { Int($0) }
let underLCM = LCM(first[1], second[1])
let upperNum = (first[0] * underLCM / first[1]) + (second[0] * underLCM / second[1])
let toDivide = GCD(upperNum, underLCM)
print("\(upperNum / toDivide) \(underLCM / toDivide)")

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return GCD(b, a % b)
}

func LCM(_ a: Int, _ b: Int) -> Int {
    return a / GCD(a, b) * b
}