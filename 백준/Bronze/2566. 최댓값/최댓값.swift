var table: [[Int]] = []
for _ in 0..<9 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    table.append(input)
}
var maximum: (i: Int, j: Int, value: Int) = (1, 1, 0)
for i in 0..<9 {
    let maxValue = table[i].enumerated().max(by: { $0.element < $1.element })!
    if maximum.value < maxValue.element {
        maximum = (i+1, maxValue.offset+1, maxValue.element)
    }
}
print("\(maximum.value)\n\(maximum.i) \(maximum.j)")