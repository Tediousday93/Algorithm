struct Heap<T: Equatable> {
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

struct EdgeInfo: Equatable {
    let cost: Int
    let node1: Int
    let node2: Int
}

func solution() {
    let VE = readLine()!.split(separator: " ").compactMap { Int($0) }
    let v = VE[0]
    let e = VE[1]
    
    var checkList: [Bool] = .init(repeating: false, count: v+1)
    var adjacency: [[(cost: Int, node: Int)]] = .init(repeating: [], count: v+1)
    
    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a = input[0]
        let b = input[1]
        let cost = input[2]
        adjacency[a].append((cost, b))
        adjacency[b].append((cost, a))
    }
    
    var selectedEdgeCount = 0
    var answer = 0
    var minHeap: Heap<EdgeInfo> = .init { lhs, rhs in
        (lhs.cost, lhs.node1, lhs.node2) < (rhs.cost, rhs.node1, rhs.node2)
    }
    
    checkList[1] = true
    for next in adjacency[1] {
        minHeap.push(EdgeInfo(cost: next.cost,
                              node1: 1,
                              node2: next.node))
    }
    
    while selectedEdgeCount < v-1 {
        guard let curEdge = minHeap.pop() else { break }
        if checkList[curEdge.node2] { continue }
        
        answer += curEdge.cost
        checkList[curEdge.node2] = true
        selectedEdgeCount += 1
        
        for next in adjacency[curEdge.node2] {
            if !checkList[next.node] {
                minHeap.push(EdgeInfo(cost: next.cost,
                                      node1: curEdge.node2,
                                      node2: next.node))
            }
        }
    }
    
    print(answer)
}
solution()