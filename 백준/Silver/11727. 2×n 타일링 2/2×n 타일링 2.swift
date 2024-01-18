let n = Int(readLine()!)!
var d: [Int] = [0, 1, 3]

while d.count <= n {
    let i = d.count
    d.append((d[i-1] + d[i-2]*2) % 10007)
}

print(d[n])