_ = Int(readLine()!)!
let numbers = readLine()!.compactMap { Int(String($0)) }
print(numbers.reduce(0, +))