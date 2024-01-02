var students: [String] = []
var result: Int = 0
let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]

for _ in 1...5 {
    let list = readLine()!.map { String($0) }
    students += list
}

func backTracking(k: Int, start: Int, indices: [Int]) {
    if k == 7 {
        if check(indices: indices) { result += 1 }
        return
    }
    
    for i in start..<25 {
        backTracking(k: k+1, start: i+1, indices: indices + [i])
    }
}

func check(indices: [Int]) -> Bool {
    var vis: [Bool] = .init(repeating: false, count: 7)
    var stack: [Int] = []
    var pointer: Int = 0
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    var sCount = 0
    var yCount = 0
    
    vis[0] = true
    if students[indices[0]] == "S" {
        sCount += 1
    } else {
        yCount += 1
    }
    
    stack.append(indices[0])
    
    while pointer < stack.count {
        let cur = stack[pointer]
        pointer += 1
        
        if yCount >= 4 { return false }
        
        for i in 0...3 {
            let nx = cur / 5 + dx[i]
            let ny = cur % 5 + dy[i]
            if !(0...4 ~= nx) || !(0...4 ~= ny) { continue }
            guard let idx = indices.firstIndex(of: nx * 5 + ny), !vis[idx] else {
                continue
            }
            
            if students[nx * 5 + ny] == "S" {
                sCount += 1
            } else {
                yCount += 1
            }
            
            vis[idx] = true
            stack.append(nx * 5 + ny)
        }
    }
    
    return (stack.count == 7) && (sCount >= 4)
}

backTracking(k: 0, start: 0, indices: [])
print(result)