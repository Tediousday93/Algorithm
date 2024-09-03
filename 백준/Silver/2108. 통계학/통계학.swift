import Foundation

let n = Int(readLine()!)!
var numbers: [Int] = []
var occur: [Int: Int] = [:]
var sum = 0
for _ in 0..<n {
    let number = Int(readLine()!)!
    sum += number
    numbers.append(number)
    occur[number, default: 0] += 1
}
numbers.sort()

let arithmeticMean = Int(
    (Double(sum) / Double(n)).rounded()
)
var ans = ""
ans += "\(arithmeticMean)\n"
ans += "\(numbers[n/2])\n"
ans += "\(mostOccured(in: occur))\n"
ans += "\(abs(numbers.last! - numbers.first!))"

print(ans)

func mostOccured(in occur: [Int: Int]) -> Int {
    let maximum = occur.max(by: { $0.value < $1.value })!
    let filtered = occur.filter { $0.value == maximum.value }
    if filtered.count > 1 {
        return filtered.keys.sorted()[1]
    } else {
        return filtered.keys.first!
    }
}