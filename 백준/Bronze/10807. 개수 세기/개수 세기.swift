let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let target = Int(readLine()!)!
print(numbers.filter { $0 == target }.count)