let N = Int(readLine()!)!
var list: Set<String> = []

for _ in 0..<N {
    let input = readLine()!
    list.insert(input)
}

var sorted = Array.init(list).sorted { lhs, rhs in
    if lhs.count != rhs.count {
        return lhs.count < rhs.count
    } else {
        return lhs < rhs
    }
}

print(sorted.joined(separator: "\n"))