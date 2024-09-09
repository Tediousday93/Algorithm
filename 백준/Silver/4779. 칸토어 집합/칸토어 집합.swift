import Foundation

var results: [String] = []
while let input = readLine(), let n = Int(input) {
    results.append(recursion(n: n))
}
print(results.joined(separator: "\n"))

func recursion(n: Int) -> String {
    if n == 0 { return "-" }
    let spaceLine = String(repeating: " ", count: Int(pow(Double(3), Double(n))) / 3)
    return recursion(n: n-1) + spaceLine + recursion(n: n-1)
}