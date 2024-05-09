import Foundation

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
    let n = Int(readLine()!)!
    var adjacency: [[(cost: Int, node: Int)]] = .init(repeating: [], count: n+2)
    var checkList: [Bool] = .init(repeating: false, count: n+2)
    
    for node in 1...n {
        let cost = Int(readLine()!)!
        adjacency[node].append((cost: cost, node: n+1))
        adjacency[n+1].append((cost: cost, node: node))
    }
    
    for cur in 1...n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        for (index, cost) in input.enumerated() {
            let node = index + 1
            if cur != node {
                adjacency[cur].append((cost: cost, node: node))
            }
        }
    }
    
    var edgeCount = 0
    var totalCost = 0
    var minHeap: Heap<EdgeInfo> = .init { lhs, rhs in
        (lhs.cost, lhs.node1, lhs.node2) < (rhs.cost, rhs.node1, rhs.node2)
    }
    
    checkList[1] = true
    for next in adjacency[1] {
        minHeap.push(EdgeInfo(cost: next.cost,
                              node1: 1,
                              node2: next.node))
    }
    
    while edgeCount < n {
        guard let curEdge = minHeap.pop() else { break }
        if checkList[curEdge.node2] { continue }
        totalCost += curEdge.cost
        checkList[curEdge.node2] = true
        edgeCount += 1
        for next in adjacency[curEdge.node2] {
            if !checkList[next.node] {
                minHeap.push(EdgeInfo(cost: next.cost,
                                      node1: curEdge.node2,
                                      node2: next.node))
            }
        }
    }
    
    print(totalCost)
}
solution()