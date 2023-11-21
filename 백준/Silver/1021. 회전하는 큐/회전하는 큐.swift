final class Deque {
    var left: [Int] = []
    var right: [Int] = []
    var size: Int {
        return left.count + right.count
    }
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    var front: Int? {
        if right.isEmpty {
            return left.first
        }
        return right.last
    }
    var back: Int? {
        if left.isEmpty {
            return right.first
        }
        return left.last
    }
    
    func index(of x: Int) -> Int {
        if left.contains(x) {
            return left.firstIndex(of: x)! + right.count
        } else {
            return right.reversed().firstIndex(of: x)!
        }
    }
    
    func pushFront(x: Int) {
        right.append(x)
    }
    
    func pushBack(x: Int) {
        left.append(x)
    }
    @discardableResult
    func popFront() -> Int? {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
    
    func popBack() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var targets: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.reversed()
let deque = Deque()
for i in 1...input[0] {
    deque.pushBack(x: i)
}

var count: Int = 0

while !targets.isEmpty {
    let t = targets.removeLast()
    let index = deque.index(of: t)
    
    while deque.front != t {
        if index <= deque.size - index {
            deque.pushBack(x: deque.popFront()!)
        } else {
            deque.pushFront(x: deque.popBack()!)
        }
        count += 1
    }
    deque.popFront()
}

print(count)