let n = Int(readLine()!)!
let m = Int(readLine()!)!
var fixed: [Int] = [0]

for _ in 0..<m {
    fixed.append(Int(readLine()!)!)
}
fixed.append(n+1)

var indices: [Int] = .init(repeating: 0, count: m+1)

for i in 0...m {
    indices[i] = fixed[i+1] - fixed[i] - 1
}

let maxIndex = indices.max()!
var d: [Int] = [1, 1, 2]
while d.count <= maxIndex {
    let i = d.count
    d.append(d[i-1] + d[i-2])
}

var ans = 1
indices.forEach { ans = ans * d[$0] }
print(ans)