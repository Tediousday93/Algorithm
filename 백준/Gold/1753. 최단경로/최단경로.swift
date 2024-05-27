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

let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let V = ve[0], E = ve[1]
let start = Int(readLine()!)!
var adjacency: [[(Int, Int)]] = .init(repeating: [], count: V+1)
var distance: [Int] = .init(repeating: Int.max, count: V+1)
for _ in 0..<E {
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let u = uvw[0], v = uvw[1], w = uvw[2]
    adjacency[u].append((w, v))
}
distance[start] = 0

var minHeap = Heap<(Int, Int)> { $0.0 < $1.0 }
minHeap.push((0, start))

while let (dist, node) = minHeap.pop() {
    if distance[node] != dist { continue }
    for (edgeDist, next) in adjacency[node] {
        if distance[next] <= distance[node] + edgeDist { continue }
        distance[next] = distance[node] + edgeDist
        minHeap.push((distance[next], next))
    }
}

var answer = ""
for i in stride(from: 1, through: V, by: 1) {
    if distance[i] == .max {
        answer += "INF\n"
    } else {
        answer += "\(distance[i])\n"
    }
}
print(answer)