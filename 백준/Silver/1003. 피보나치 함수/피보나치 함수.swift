let N = Int(readLine()!)!

func fibo(n: Int) -> (Int, Int) {
    var d: [(Int, Int)] = .init(repeating: (0, 0), count: n+1)
    
    if n == 0 {
        return (1, 0)
    } else if n == 1 {
        return (0, 1)
    } else {
        d[0] = (1, 0)
        d[1] = (0, 1)
        for i in 2...n {
            d[i] = (d[i-1].0+d[i-2].0, d[i-1].1+d[i-2].1)
        }
        return d[n]
    }
}

var result: String = ""
for _ in 0..<N {
    let (zero, one) = fibo(n: Int(readLine()!)!)
    result += "\(zero) \(one)\n"
}

print(result)