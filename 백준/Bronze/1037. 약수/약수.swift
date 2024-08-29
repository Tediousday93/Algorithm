let count = Int(readLine()!)!
var measures: [Int] = readLine()!.split(separator: " ")
    .compactMap { Int($0) }
    .sorted()
print(measures.first! * measures.last!)