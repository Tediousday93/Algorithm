import Foundation

var results: [String] = []
while let input = readLine(), let n = Int(input) {
    var line = String(repeating: "-", count: Int(pow(Double(3), Double(n))))
    results.append(recursion(n: n, line: line))
}
print(results.joined(separator: "\n"))

func recursion(n: Int, line: String) -> String {
    if n == 0 { return "-" }
    let dashLine = String(repeating: "-", count: line.count / 3)
    let spaceLine = String(repeating: " ", count: line.count / 3)
    return recursion(n: n-1, line: dashLine) + spaceLine + recursion(n: n-1, line: dashLine)
}