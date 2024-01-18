let n = Int(readLine()!)!
var d: [(Int, Int)] = [(0, 0), (0, 1), (1, 0), (1, 1)]

while d.count <= n {
    let i = d.count
    d.append((d[i-1].0 + d[i-1].1, d[i-1].0))
}

print(d[n].0 + d[n].1)