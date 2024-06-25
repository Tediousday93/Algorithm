let text = readLine()!.uppercased().map { String($0) }
let asciiValueA = UnicodeScalar("A").value
var occurs: [Int] = .init(repeating: 0, count: 26)
for char in text {
    let index = Int(UnicodeScalar(char)!.value - asciiValueA)
    occurs[index] += 1
}
let maxOccurance = occurs.max()!
let maxOccurs: [(offset: Int, element: Int)] = occurs.enumerated().filter { $0.element == maxOccurance }
var ans = ""
if maxOccurs.count != 1 {
    ans = "?"
} else {
    ans = String(UnicodeScalar(maxOccurs.last!.offset + Int(asciiValueA))!)
}
print(ans)