let n = Int(readLine()!)!
var dict: [Int: Int] = [:]
for _ in 0..<n {
    dict[Int(readLine()!)!, default: 0] += 1
}
print(dict.max(by: { $0.value != $1.value ? $0.value < $1.value : $0.key > $1.key })!.key)