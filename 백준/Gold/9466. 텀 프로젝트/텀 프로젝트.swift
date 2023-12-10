let t = Int(readLine()!)!
let notVisited: Int = -2
let cycleIn: Int = -1

func solution() {
    let n = Int(readLine()!)!
    var board: [Int] = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    var state: [Int] = .init(repeating: notVisited, count: n)
    var ans: Int = 0
    
    func check(_ x: Int) {
        var cur = x
        while true {
            state[cur] = x
            
            cur = board[cur]
            if state[cur] == x {
                while state[cur] != cycleIn {
                    state[cur] = cycleIn
                    cur = board[cur]
                }
                return
            } else if state[cur] != notVisited {
                return
            }
        }
    }
    
    for i in 0..<n {
        if state[i] == notVisited { check(i) }
    }
    for i in 0..<n {
        if state[i] != cycleIn { ans += 1 }
    }
    print(ans)
}

for _ in 0..<t {
    solution()
}
