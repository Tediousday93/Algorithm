let t = Int(readLine()!)!
var recursionCount = 0
var results: [String] = []

for _ in 0..<t {
    let input = readLine()!
    var result = ""
    if isPalindrome(input) {
        result = "1 \(recursionCount)"
    } else {
        result = "0 \(recursionCount)"
    }
    results.append(result)
    recursionCount = 0
}

print(results.joined(separator: "\n"))

func recursion(_ s: [String], left: Int, right: Int) -> Bool {
    recursionCount += 1
    if left >= right { return true }
    else if s[left] != s[right] { return false }
    else { return recursion(s, left: left+1, right: right-1) }
}

func isPalindrome(_ s: String) -> Bool {
    return recursion(s.map(String.init), left: 0, right: s.count - 1)
}