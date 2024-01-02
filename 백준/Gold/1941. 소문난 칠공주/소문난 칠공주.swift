var students: [String] = []
var board: [[String]] = []
var result: Int = 0
let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]

for _ in 1...5 {
    let list = readLine()!.map { String($0) }
    students += list
    board.append(list)
}

func backTracking(k: Int, start: Int, indices: [(Int, Int)]) {
    if k == 7 {
        if checkSeat(indices: indices) { result += 1 }
        return
    }
    
    for i in start..<25 {
        backTracking(k: k+1, start: i+1, indices: indices + [(i/5, i%5)])
    }
}

func checkSeat(indices: [(Int, Int)]) -> Bool {
    var vis: [[Bool]] = .init(repeating: .init(repeating: false, count: 5), count: 5)
    var stack: [(Int, Int)] = []
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    let firstIndex = indices[0]
    var connected = 0
    var sCount = 0
    var yCount = 0
    
    vis[firstIndex.0][firstIndex.1] = true
    if board[firstIndex.0][firstIndex.1] == "S" {
        sCount += 1
    } else {
        yCount += 1
    }
    connected += 1
    stack.append(firstIndex)
    
    while let cur = stack.popLast() {
        if yCount >= 4 { return false }
        
        for i in 0...3 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]
            if !(0...4 ~= nx) || !(0...4 ~= ny) { continue }
            if vis[nx][ny] { continue }
            if indices.contains(where: { $0 == (nx, ny) }) {
                if board[nx][ny] == "S" {
                    sCount += 1
                } else {
                    yCount += 1
                }
                connected += 1
                vis[nx][ny] = true
                stack.append((nx, ny))
            }
        }
    }
    
    return (connected == 7 ? true : false) && (sCount >= 4)
}

backTracking(k: 0, start: 0, indices: [])
print(result)