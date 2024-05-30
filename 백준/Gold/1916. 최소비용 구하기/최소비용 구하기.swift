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

let INF = Int.max / 2
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var adjacency: [[(Int, Int)]] = .init(repeating: [], count: n+1)
var costList: [Int] = .init(repeating: INF, count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (start, end, cost) = (input[0], input[1], input[2])
    adjacency[start].append((cost, end))
}
let sten = readLine()!.split(separator: " ").compactMap { Int($0) }
let (start, end) = (sten[0], sten[1])
costList[start] = 0

var minHeap = Heap<(Int, Int)> { $0.0 < $1.0 }
minHeap.push((0, start))

while let (cost, cur) = minHeap.pop() {
    if cost != costList[cur] { continue }
    for (nextCost, next) in adjacency[cur] {
        if costList[next] <= costList[cur] + nextCost { continue }
        costList[next] = costList[cur] + nextCost
        minHeap.push((costList[next], next))
    }
}

print(costList[end])