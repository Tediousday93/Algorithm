let t = Int(readLine()!)!

func largeThirdNumber(in arr: [Int]) -> Int {
    let sorted = arr.sorted(by: >)
    return sorted[2]
}

var answers: [String] = []
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    answers.append(String(largeThirdNumber(in: input)))
}
print(answers.joined(separator: "\n"))