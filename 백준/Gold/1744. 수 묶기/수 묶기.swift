let n = Int(readLine()!)!
var positives: [Int] = []
var notPositives: [Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!

    if num > 0 {
        positives.append(num)
    } else {
        notPositives.append(num)
    }
}

var positiveSum: Int = 0
var notPositiveSum: Int = 0

positives.sort(by: >)
let positiveLastIndex = positives.count - 1
for index in stride(from: 0, to: positiveLastIndex, by: 2) {
    if positives[index + 1] != 1 {
        positiveSum += positives[index] * positives[index + 1]
    } else {
        positiveSum += positives[index] + positives[index + 1]
    }
}
if positiveLastIndex % 2 == 0 {
    positiveSum += positives[positiveLastIndex]
}

notPositives.sort()
let notPositiveLastIndex = notPositives.count - 1
for index in stride(from: 0, to: notPositiveLastIndex, by: 2) {
    notPositiveSum += notPositives[index] * notPositives[index + 1]
}
if notPositiveLastIndex % 2 == 0 {
    notPositiveSum += notPositives[notPositiveLastIndex]
}

print(positiveSum + notPositiveSum)