let n = Int(readLine()!)!
var isDancing: [String: Bool] = [:]
isDancing["ChongChong"] = true

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map(String.init)
    if isDancing[input[0], default: false] || isDancing[input[1], default: false] {
        isDancing[input[0]] = true
        isDancing[input[1]] = true
    }
}

print(isDancing.values.filter({ $0 }).count)