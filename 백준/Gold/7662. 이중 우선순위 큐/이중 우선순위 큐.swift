import Foundation

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

let testCount = Int(readLine()!)!
var results: [String] = []

func excuteOperation() {
    var maxHeap = Heap<Int>(compareMethod: >)
    var minHeap = Heap<Int>(compareMethod: <)
    var elementDict: [Int: Int] = [:]

    let operationCount = Int(readLine()!)!

    for _ in 0..<operationCount {
        let input = readLine()!.split(separator: " ")
        let value = Int(input[1])!

        switch input[0] {
            case "I":
            maxHeap.push(value)
            minHeap.push(value)
            elementDict[value, default: 0] += 1
            case "D":
            let removed = realPop(operationValue: value)

            if let removed = removed, isActuallyHave(removed) {
                elementDict[removed]! -= 1
            }
            default:
            break
        }
    }

    func realPop(operationValue: Int) -> Int? {
        var removed: Int?

        if operationValue == 1 {
            while !maxHeap.isEmpty {
                if let cur = maxHeap.pop(), isActuallyHave(cur) {
                    removed = cur
                    break
                }
            }
        } else {
            while !minHeap.isEmpty {
                if let cur = minHeap.pop(), isActuallyHave(cur) {
                    removed = cur
                    break
                }
            }
        }

        return removed
    }

    func isActuallyHave(_ x: Int) -> Bool {
        if let count = elementDict[x], count > 0 {
            return true
        } else {
            return false
        }
    }

    let min = realPop(operationValue: -1)
    let max = realPop(operationValue: 1)
    var result = ""

    if let min = min, let max = max {
        result = "\(max) \(min)"
    } else {
        result = "EMPTY"
    }

    results.append(result)
}

for _ in 0..<testCount {
    excuteOperation()
}

print(results.joined(separator: "\n"))