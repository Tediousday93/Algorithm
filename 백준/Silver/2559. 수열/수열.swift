let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0], k = nk[1]
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var partialSum: [Int] = .init(repeating: 0, count: n+1)

for i in 1...n {
    partialSum[i] = partialSum[i-1] + numbers[i-1]
}

var serialSum: [Int] = []
serialSum.append(partialSum[k])
for i in stride(from: k+1, through: n, by: 1) {
    serialSum.append(partialSum[i] - partialSum[i-k])
}

print(serialSum.max()!)