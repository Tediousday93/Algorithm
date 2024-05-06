struct Queue<T> {
    var pushStack: [T] = .init()
    var popStack: [T] = .init()
    
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

func solution() {
    let N = Int(readLine()!)!
    let names: [String] = readLine()!.split(separator: " ").map { String($0) }.sorted()
    let M = Int(readLine()!)!
    var nameIndices: [String: Int] = [:]
    names.enumerated().forEach { nameIndices[$0.element] = $0.offset }
    
    var tree: [[Int]] = .init(repeating: [], count: N)
    var indegree: [Int] = .init(repeating: 0, count: N)
    var outdegree: [Int] = .init(repeating: 0, count: N)
    
    for _ in 0..<M {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let childIndex = nameIndices[input[0]]!
        let parentIndex = nameIndices[input[1]]!
        tree[childIndex].append(parentIndex)
        indegree[parentIndex] += 1
        outdegree[childIndex] += 1
    }
    
    var queue: Queue<Int> = .init()
    var children: [[Int]] = .init(repeating: [], count: N)
    indegree.enumerated()
        .filter { $0.element == 0 }
        .forEach { queue.enqueue($0.offset) }
    
    while let cur = queue.dequeue() {
        for parent in tree[cur] {
            if outdegree[parent] == outdegree[cur] - 1 {
                children[parent].append(cur)
                indegree[parent] -= 1
                if indegree[parent] == 0 { queue.enqueue(parent) }
            }
        }
    }
    
    var K = 0
    var ancestorNames: [String] = []
    var informations: [String] = []
    
    outdegree.enumerated()
        .filter { $0.element == 0 }
        .forEach { ancestorNames.append(names[$0.offset]) }
    
    children.enumerated().forEach {
        let parentName = names[$0.offset]
        let childrenCount = $0.element.count
        var childrenNames: [String] = []
        for index in $0.element {
            childrenNames.append(names[index])
        }
        let info = "\(parentName) \(childrenCount) \(childrenNames.joined(separator: " "))"
        informations.append(info)
    }
    
    K = ancestorNames.count
    
    print("\(K)\n\(ancestorNames.joined(separator: " "))\n\(informations.joined(separator: "\n"))")
}
solution()