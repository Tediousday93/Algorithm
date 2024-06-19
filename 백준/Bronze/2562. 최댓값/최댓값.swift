var numbers: [Int] = []
for _ in 0..<9 {
    let num = Int(readLine()!)!
    numbers.append(num)
}
let target = numbers.enumerated().sorted(by: { $0.element < $1.element }).last!
print("\(target.element)\n\(target.offset + 1)")