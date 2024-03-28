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
    let testCount = Int(readLine()!)!
    
    func getMinimumPrice() -> String {
        _ = readLine()
        var minHeap = Heap<Int>(compareMethod: <)
        let pages = readLine()!.split(separator: " ").compactMap { Int($0) }
        pages.forEach { minHeap.push($0) }
        
        var price = 0
        
        while minHeap.count > 1 {
            let combined = minHeap.pop()! + minHeap.pop()!
            price += combined
            minHeap.push(combined)
        }
        
        return String(price)
    }
    
    var answer = ""
    for _ in 0..<testCount {
        answer += getMinimumPrice() + "\n"
    }
    print(answer)
}
solution()