import Foundation
let data: [Int] = readLine()!.split(separator:" ").map { Int($0)! }
let repeatCount = data[0]
let k = Double(data[1])
var boy: [Int] = .init(repeating: 0, count: 6)
var girl: [Int] = .init(repeating: 0, count: 6)
for _ in 1...repeatCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == 0 {
        girl[input[1] - 1] += 1
    } else {
        boy[input[1] - 1] += 1
    }
}
let bRoom = boy.map { Int((Double($0) / k).rounded(.up)) }.reduce(0, +)
let gRoom = girl.map { Int((Double($0) / k).rounded(.up)) }.reduce(0, +)
print(bRoom + gRoom)