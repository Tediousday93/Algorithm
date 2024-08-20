import Foundation

let io = FileIO()
let n = io.readInt()
var isQueue: [Bool] = []
for _ in 0..<n {
    isQueue.append(io.readInt() == 0)
}
var B: [Int] = []
var queue: Queue<Int> = .init()
for i in 0..<n {
    let input = io.readInt()
    if isQueue[i] { B.append(input) }
}
for integer in B.reversed() {
    queue.enqueue(integer)
}
let m = io.readInt()
var toPush: [Int] = []
for _ in 0..<m {
    toPush.append(io.readInt())
}

var result = ""
for integer in toPush {
    queue.enqueue(integer)
    if let removed = queue.dequeue() {
        result += "\(removed) "
    }
}
print(result)

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

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

struct Queue<T> {
    private var pushStack: [T] = .init()
    private var popStack: [T] = .init()
    
    var isEmpty: Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
    var count: Int {
        return pushStack.count + popStack.count
    }

    mutating func enqueue(_ element: T) {
        pushStack.append(element)
    }

    mutating func dequeue() -> T? {
        if popStack.isEmpty {
            popStack = pushStack.reversed()
            pushStack.removeAll()
        }
        return popStack.popLast()
    }
}
