var numbers: [Int] = []
for _ in 0..<5 {
    numbers.append(Int(readLine()!)!)
}
numbers.sort(by: <)
print("\(numbers.reduce(0, +) / 5)\n\(numbers[2])")