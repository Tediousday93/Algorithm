var ans: String = ""

func moveCount(n: Int) -> Int {
    return (1 << n) - 1
}

func hanoi(start: Int, end: Int, n: Int) {
    if n == 1 {
        ans += "\(start) \(end)\n"
        return
    }
    hanoi(start: start, end: 6-start-end, n: n-1)
    ans += "\(start) \(end)\n"
    hanoi(start: 6-start-end, end: end, n: n-1)
}

let k = Int(readLine()!)!
print(moveCount(n: k))
hanoi(start: 1, end: 3, n: k)
print(ans)