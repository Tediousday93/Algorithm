let kl = readLine()!.split(separator: " ").compactMap { Int($0) }
let K = kl[0]
let L = kl[1]
var registerOrder: [String: Int] = [:]
var cur = 0
for _ in 0..<L {
    let studentNumber = readLine()!
    registerOrder[studentNumber] = cur
    cur += 1
}

let sorted = registerOrder.sorted { $0.value < $1.value }
var successed: [String] = []
if sorted.count < K {
    sorted.forEach { successed.append($0.key) }
} else {
    for index in 0..<K {
        successed.append(sorted[index].key)
    }
}
print(successed.joined(separator: "\n"))