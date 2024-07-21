let n = Int(readLine()!)!
var numbers: [Int] = []
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}
numbers.sort(by: <)
print(numbers.map(String.init).joined(separator: "\n"))