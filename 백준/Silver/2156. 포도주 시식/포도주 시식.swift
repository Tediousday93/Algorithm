func solution() {
    let n = Int(readLine()!)!
    var wines: [Int] = []
    for _ in 0..<n {
        wines.append(Int(readLine()!)!)
    }
    wines.append(0)
    
    if n == 1 {
        print(wines[0])
        return
    } else if n == 2 {
        print(wines.reduce(0, +))
        return
    }
    
    var d: [Int] = .init(repeating: 0, count: n+1)
    d[0] = wines[0]
    d[1] = wines[1]
    d[2] = wines[2]
    
    for i in stride(from: 3, through: n, by: 1) {
        d[i] = min(d[i-1], d[i-2], d[i-3]) + wines[i]
    }
    
    print(wines.reduce(0, +) - d[n])
}
solution()