import Foundation

enum Operation: Int {
    case pushFront = 1
    case pushBack, popFront, popBack,
    count, isEmpty, first, last
}

final class Node<T> {
    var next: Node<T>?
    var prev: Node<T>?
    var data: T
    
    init(_ data: T, next: Node<T>? = nil, prev: Node<T>? = nil) {
        self.data = data
    }
}

struct Deque<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private(set) var count: Int = 0
    
    init() { }
    
    var first: Element? { head?.data }
    var last: Element? { tail?.data }
    var isEmpty: Bool { count == 0 }
    
    mutating func pushFront(_ element: Element) {
        let newNode = Node(element)
        newNode.next = head
        
        if let curHead = head { curHead.prev = newNode }
        
        head = newNode
        count += 1
        
        if head?.next == nil { tail = head }
    }
    
    mutating func pushBack(_ element: Element) {
        if count == 0 {
            pushFront(element)
            return
        }
        
        let newNode = Node(element)
        
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        count += 1
    }
    
    mutating func popFront() -> Element? {
        if count == 0 { return nil }
        
        let data = head?.data
        let nextNode = head?.next
        
        if let next = nextNode {
            next.prev = nil
        }
        head = nextNode
        count -= 1
        
        if count == 0 { tail = nil }
        
        return data
    }
    
    mutating func popBack() -> Element? {
        if count == 0 { return nil }
        
        let data = tail?.data
        let prevNode = tail?.prev
        
        if let prev = prevNode {
            prev.next = nil
        }
        tail = prevNode
        count -= 1
        
        if count == 0 { head = nil }
        
        return data
    }
}

var deque: Deque<Int> = .init()
let operationCount = Int(readLine()!)!

var result = ""
for _ in 0..<operationCount {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    if let operation = Operation(rawValue: input[0]) {
        switch operation {
            case .pushFront:
                deque.pushFront(input[1])
            case .pushBack:
                deque.pushBack(input[1])
            case .popFront:
                if let integer = deque.popFront() {
                    result += "\(integer)\n"
                } else {
                    result += "-1\n"
                }
            case .popBack:
                if let integer = deque.popBack() {
                    result += "\(integer)\n"
                } else {
                    result += "-1\n"
                }
            case .count:
                result += "\(deque.count)\n"
            case .isEmpty:
                result += "\(deque.isEmpty ? 1 : 0)\n"
            case .first:
                if let first = deque.first {
                    result += "\(first)\n"
                } else {
                    result += "-1\n"
                }
            case .last:
                if let last = deque.last {
                    result += "\(last)\n"
                } else {
                    result += "-1\n"
                }
        }
    }
}

print(result)