struct Heap<T> {
    var isEmpty: Bool { storage.count <= 1 }
    var count: Int { storage.count - 1 }
    var root: T? { storage.first }
    
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

let nmx = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m, target) = (nmx[0], nmx[1], nmx[2])
var adjacency: [[(Int, Int)]] = .init(repeating: [], count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (a, b, t) = (input[0], input[1], input[2])
    adjacency[a].append((t, b))
}

var totalTimes: [Int] = []
for i in 1...n {
    let total = minimumDistance(from: i, to: target) + minimumDistance(from: target, to: i)
    totalTimes.append(total)
}
print(totalTimes.max()!)

func minimumDistance(from start: Int, to end: Int) -> Int {
    var time: [Int] = .init(repeating: .max, count: n+1)
    time[start] = 0

    var minHeap = Heap<(Int, Int)> { $0.0 < $1.0 }
    minHeap.push((0, start))
    while let (curTime, curNode) = minHeap.pop() {
        if time[curNode] != curTime { continue }
        for (t, next) in adjacency[curNode] {
            if time[next] <= time[curNode] + t { continue }
            time[next] = time[curNode] + t
            minHeap.push((time[next], next))
        }
    }

    return time[end]
}