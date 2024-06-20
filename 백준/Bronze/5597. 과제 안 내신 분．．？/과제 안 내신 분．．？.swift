var arr: [Bool] = .init(repeating: false, count: 30)
for _ in 0..<28 {
    let index = Int(readLine()!)!
    arr[index-1] = true
}
let notSubmitted = arr.enumerated()
    .filter { $0.element == false }
    .map { String($0.offset + 1) }
    .joined(separator: "\n")
print(notSubmitted)