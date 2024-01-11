let N = Int(readLine()!)!
var list: Set<String> = []

for _ in 0..<N {
    let input = readLine()!
    list.insert(input)
}

let ans = Array(list).sorted(by: { lhs, rhs in
    if lhs.count != rhs.count {
        return lhs.count < rhs.count
    } else {
        return lhs < rhs
    }
}).joined(separator: "\n")

print(ans)