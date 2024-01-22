let t = Int(readLine()!)!
var d: [Int] = [1, 1, 1, 2, 2]

for _ in 0..<t {
    let n = Int(readLine()!)!

    while d.count < n {
        let i = d.count
        d.append(d[i-1] + d[i-5])
    }

    print(d[n-1])
}