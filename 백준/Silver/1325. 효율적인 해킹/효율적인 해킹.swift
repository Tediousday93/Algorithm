import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

func solution() {
    let io = FileIO()
    let n = io.readInt()
    let m = io.readInt()
    
    var graph: [[Int]] = .init(repeating: [], count: n + 1)
    for _ in 0..<m {
        let a = io.readInt()
        let b = io.readInt()
        graph[b].append(a)
    }
    
    func dfs(cur: Int) -> Int {
        var stack: [Int] = []
        var vis: [Bool] = .init(repeating: false, count: n + 1)
        var count = 0
        stack.append(cur)
        vis[cur] = true
        
        while let cur = stack.popLast() {
            for next in graph[cur] {
                if vis[next] { continue }
                stack.append(next)
                vis[next] = true
                count += 1
            }
        }
        
        return count
    }
    
    var result: [String] = []
    var max = 0
    for i in 1...n {
        let hackableCount = dfs(cur: i)
        
        if max < hackableCount {
            max = hackableCount
            result = [String(i)]
        } else if max == hackableCount {
            result.append(String(i))
        }
    }
    
    print(result.joined(separator: " "))
}
solution()