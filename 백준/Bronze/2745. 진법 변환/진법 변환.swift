let input = readLine()!.split(separator: " ").map { String($0) }
let n: [Int] = input[0].map({ String($0) })
    .reversed()
    .map { number in
        if let integer = Int(number) {
            return integer
        } else {
            return Int(UnicodeScalar(number)!.value) - 55
        }
    }
let b = Int(input[1])!
var digit = 1
var decimal = 0
for i in 0..<n.count {
    decimal += n[i] * digit
    digit *= b
}
print(decimal)