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

struct Jewel: Comparable {
    static func < (lhs: Jewel, rhs: Jewel) -> Bool {
        lhs.price < rhs.price
    }

    let weight: Int
    let price: Int
}

func solution() {
    let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nk[0]
    let k = nk[1]
    var jewels: [Jewel] = []
    var bags: [Int] = []
    var answer: UInt = 0
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        jewels.append(Jewel(weight: input[0], price: input[1]))
    }
    jewels.sort { $0.weight < $1.weight }
    
    for _ in 0..<k {
        bags.append(Int(readLine()!)!)
    }
    bags.sort(by: <)
    
    var maxHeap = Heap<Jewel>(compareMethod: >)
    var jewelIndex = 0
    
    for bag in bags {
        while jewelIndex < jewels.count,
              jewels[jewelIndex].weight <= bag {
            maxHeap.push(jewels[jewelIndex])
            jewelIndex += 1
        }
        
        let jewel = maxHeap.pop()
        answer += UInt(jewel?.price ?? 0)
    }
    
    print(answer)
}

solution()