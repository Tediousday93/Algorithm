final class Queue<T> {
    var arr: [T]
    var head: Int = 0
    var tail: Int = 0
    
    init(arr: [T]) {
        self.arr = arr
    }
    
    var front: T { arr[head] }
    var isEmpty: Bool { head == tail }
    
    func push(_ t: T) {
        arr[tail] = t
        tail += 1
    }
    
    func pop() {
        head += 1
    }
}

func solution() {
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let l = Int(readLine()!)!
        var distance: [[Int]] = .init(
            repeating: .init(repeating: -1, count: l),
            count: l
        )
        let Q: Queue<(Int, Int)> = .init(arr: .init(repeating: (-1, -1), count: l*l + 5))
        let knight = readLine()!.split(separator: " ").compactMap { Int($0) }
        distance[knight[0]][knight[1]] = 0
        Q.push((knight[0], knight[1]))
        let target = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        let dx: [Int] = [1, 1, 2, 2, -1, -1, -2, -2]
        let dy: [Int] = [2, -2, 1, -1, 2, -2, 1, -1]
        
        while distance[target[0]][target[1]] == -1 {
            let cur = Q.front
            Q.pop()
            
            for i in 0...7 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]
                
                if !(0..<l ~= nx) || !(0..<l ~= ny) { continue }
                if distance[nx][ny] != -1 { continue }
                distance[nx][ny] = distance[cur.0][cur.1] + 1
                Q.push((nx, ny))
            }
        }
        print(distance[target[0]][target[1]])
    }
}

solution()