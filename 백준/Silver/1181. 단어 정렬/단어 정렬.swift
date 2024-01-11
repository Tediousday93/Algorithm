let N = Int(readLine()!)!
var list: Set<String> = []

for _ in 0..<N {
    let input = readLine()!
    list.insert(input)
}

let tuples = Array(list).map { ($0.count, $0) }
let ans = tuples
    .sorted(by: { lhs, rhs in
        lhs.0 != rhs.0 ? (lhs.0 < rhs.0) : (lhs < rhs)
    })
    .map { $0.1 }
    .joined(separator: "\n")

print(ans)