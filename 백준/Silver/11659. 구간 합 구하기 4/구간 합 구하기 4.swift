let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var partialSums: [Int] = .init(repeating: 0, count: n)
partialSums[0] = numbers[0]

for i in 1..<n {
    partialSums[i] = partialSums[i - 1] + numbers[i]
}

var answers: [Int] = []

for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").compactMap { Int($0) }
    let i = ij[0] - 1, j = ij[1] - 1
    if i == 0 {
        answers.append(partialSums[j])
    } else {
        answers.append(partialSums[j] - partialSums[i - 1])
    }
}

print(answers.map(String.init).joined(separator: "\n"))