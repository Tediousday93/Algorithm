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

func solution() {
    let start = 1
    let INF = Int.max / 3
    let ne = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, e) = (ne[0], ne[1])
    var adjacency: [[(Int, Int)]] = .init(repeating: [], count: n+1)
    var distance: [Int] = []
    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (start, end, dist) = (input[0], input[1], input[2])
        adjacency[start].append((dist, end))
        adjacency[end].append((dist, start))
    }
    let targets = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (v1, v2) = (targets[0], targets[1])
    
    let route1 = minimumDistance(from: start, to: v1) + minimumDistance(from: v1, to: v2) + minimumDistance(from: v2, to: n)
    let route2 = minimumDistance(from: start, to: v2) + minimumDistance(from: v2, to: v1) + minimumDistance(from: v1, to: n)
    var minRoute = min(route1, route2)
    if minRoute >= INF { minRoute = -1 }
    print(minRoute)
    
    func minimumDistance(from start: Int, to end: Int) -> Int {
        distance = .init(repeating: INF, count: n+1)
        distance[start] = 0
        
        var minHeap = Heap<(Int, Int)> { $0.0 < $1.0 }
        minHeap.push((0, start))
        
        while let (dist, cur) = minHeap.pop() {
            if distance[cur] != dist { continue }
            for (nextDist, next) in adjacency[cur] {
                if distance[next] <= distance[cur] + nextDist { continue }
                distance[next] = distance[cur] + nextDist
                minHeap.push((distance[next], next))
            }
        }
        return distance[end]
    }
}
solution()