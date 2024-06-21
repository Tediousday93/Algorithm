let S = readLine()!
let asciiValueOfa = Int(UnicodeScalar("a").value)
var occurs: [Int] = .init(repeating: -1, count: 26)
for (index, char) in S.enumerated() {
    let ascii = Int(UnicodeScalar(String(char))!.value) - asciiValueOfa
    if occurs[ascii] == -1 { occurs[ascii] = index }
}
print(occurs.map { String($0) }.joined(separator: " "))