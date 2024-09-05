let n = Int(readLine()!)!

func fibo(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    return fibo(n-1) + fibo(n-2)
}

print(fibo(n))