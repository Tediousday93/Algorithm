var results: [String] = []
var testCase: Int = 0
while let input = readLine(), input != "0 0 0" {
    testCase += 1
    let lpv = input.split(separator: " ").compactMap { Int($0) }
    let l = lpv[0]
    let p = lpv[1]
    let v = lpv[2]

    let caseMessage = "Case \(testCase): "
    results.append(caseMessage + String(v/p*l + min(v%p, l)))
}
print(results.joined(separator: "\n"))