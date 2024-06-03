let S = readLine()!.map { $0 }
let P = readLine()!.map { $0 }
let f = failure(of: P)
var j = 0
var ans = false

for i in 0..<S.count {
    while j > 0 && S[i] != P[j] {
        j = f[j-1]
    }
    if S[i] == P[j] { j += 1 }
    if j == P.count {
        ans = true
        break
    }
}

print(ans ? 1 : 0)

func failure(of s: [Character]) -> [Int] {
    var f: [Int] = .init(repeating: 0, count: s.count)
    var j = 0
    for i in 1..<s.count {
        while j > 0 && s[i] != s[j] {
            j = f[j-1]
        }
        if s[i] == s[j] {
            j += 1
            f[i] = j
        }
    }
    return f
}