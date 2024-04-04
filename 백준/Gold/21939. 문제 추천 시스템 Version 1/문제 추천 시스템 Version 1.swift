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

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
}

struct Heap<T: Comparable> {
    var isEmpty: Bool { storage.count <= 1 }
    var count: Int { storage.count - 1 }
    
    private var storage: [T] = []
    private let compareMethod: (T, T) -> Bool
    
    init(compareMethod: @escaping (T, T) -> Bool) {
        self.compareMethod = compareMethod
    }
    
    init(from data: T..., compareMethod: @escaping (T, T) -> Bool) {
        self.compareMethod = compareMethod
        storage.append(data[0])
        data.forEach { storage.append($0) }
    }
    
    func contains(_ x: T) -> Bool {
        return storage.contains(x)
    }
    
    mutating func push(_ x: T) {
        if storage.isEmpty {
            storage.append(x)
            storage.append(x)
            return
        }
        
        storage.append(x)
        
        var insertIndex = storage.count - 1
        while insertIndex != 1 {
            let parent = insertIndex / 2
            if compareMethod(storage[parent], storage[insertIndex]) { break }
            storage.swapAt(parent, insertIndex)
            insertIndex = parent
        }
    }
    
    mutating func pop() -> T? {
        guard !self.isEmpty else { return nil }
        
        storage.swapAt(1, self.count)
        let removed = storage.removeLast()
        
        var index = 1
        while 2 * index <= self.count {
            let left = 2 * index
            let right = 2 * index + 1
            
            var properChild = left
            if right <= self.count && compareMethod(storage[right], storage[left]) {
                properChild = right
            }
            if compareMethod(storage[index], storage[properChild]) {
                break
            }
            storage.swapAt(index, properChild)
            index = properChild
        }
        
        return removed
    }
}

struct Problem: Comparable {
    static func < (lhs: Problem, rhs: Problem) -> Bool {
        if lhs.level != rhs.level {
            return lhs.level < rhs.level
        } else {
            return lhs.number < rhs.number
        }
    }
    
    let number: Int
    let level: Int
}

func solution() {
    let io = FileIO()
    let n = io.readInt()
    var maxHeap = Heap<Problem>(compareMethod: >)
    var minHeap = Heap<Problem>(compareMethod: <)
    var problemDict: [Int: Int] = [:]
    
    func getProblem() -> Problem {
        let number = io.readInt()
        let level = io.readInt()
        return Problem(number: number, level: level)
    }
    
    for _ in 0..<n {
        let problem = getProblem()
        maxHeap.push(problem)
        minHeap.push(problem)
        problemDict[problem.number] = problem.level
    }
    
    func realPop(order: Int) -> Problem? {
        var popped: Problem? = nil
        
        if order == 1 {
            while let cur = maxHeap.pop() {
                if isActuallyHave(cur) {
                    popped = cur
                    break
                }
            }
        } else {
            while let cur = minHeap.pop() {
                if isActuallyHave(cur) {
                    popped = cur
                    break
                }
            }
        }
        
        return popped
    }
    
    func isActuallyHave(_ x: Problem) -> Bool {
        if let level = problemDict[x.number] {
            return x.level == level
        }
        return false
    }
    
    let m = io.readInt()
    var results: [String] = []
    
    for _ in 0..<m {
        let operation = io.readString()
        switch operation {
        case "add":
            let problem = getProblem()
            maxHeap.push(problem)
            minHeap.push(problem)
            problemDict[problem.number] = problem.level
        case "solved":
            let number = io.readInt()
            problemDict.removeValue(forKey: number)
        default:
            let order = io.readInt()
            let recommended = realPop(order: order)!
            if order == 1 {
                maxHeap.push(recommended)
            } else {
                minHeap.push(recommended)
            }
            results.append(String(recommended.number))
        }
    }
    
    print(results.joined(separator: "\n"))
}

solution()