func solution() {
    let n = Int(readLine()!)!
    var d: [[Int]] = .init(
        repeating: .init(repeating: 0, count: 3),
        count: n+1
    )
    
    var points: [Int] = .init(repeating: 0, count: n+1)
    for i in 1...n {
        points[i] = Int(readLine()!)!
    }
    
    d[1][1] = points[1]
    
    if n == 1 {
        print(d[1][1])
        return
    }
    
    d[2][1] = points[2]
    d[2][2] = points[1] + points[2]
    
    if n == 2 {
        print(max(d[2][1], d[2][2]))
        return
    }
    
    for i in 3...n {
        d[i][1] = max(d[i-2][1], d[i-2][2]) + points[i]
        d[i][2] = d[i-1][1] + points[i]
    }
    
    print(max(d[n][1], d[n][2]))
}

solution()