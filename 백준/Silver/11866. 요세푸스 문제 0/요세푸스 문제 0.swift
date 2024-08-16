import Foundation

struct Queue<T> {
    private var pushStack: [T] = .init()
    private var popStack: [T] = .init()
    
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

var queue: Queue<Int> = .init()
var ans: [String] = []
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0], k = input[1]

for num in 1...n {
    queue.enqueue(num)
}

while queue.count != 1 {
    for _ in 0..<k-1 {
        queue.enqueue(queue.dequeue()!)
    }
    ans.append(String(queue.dequeue()!))
}
ans.append(String(queue.dequeue()!))

print("<\(ans.joined(separator: ", "))>")