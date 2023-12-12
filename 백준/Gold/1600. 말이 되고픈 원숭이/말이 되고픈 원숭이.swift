//
//  BOJ01600.swift
//  Algorithm - 말이 되고픈 원숭이
//
//  Created by Rowan on 2023/12/12.
//

final class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

final class Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var front: T? {
        return head?.value
    }
    
    var back: T? {
        return tail?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func push(_ x: T) {
        let n = Node<T>(value: x)
        
        if head == nil {
            head = n
            tail = head
        } else {
            tail?.next = n
            tail = n
        }
    }
    
    func pop() {
        head = head?.next
        if head == nil {
            tail = nil
        }
    }
}

func solution() {
    let k = Int(readLine()!)!
    let WH = readLine()!.split(separator: " ").compactMap { Int($0) }
    let w = WH[0]
    let h = WH[1]
    var board: [[Int]] = []
    for _ in 0..<h {
        board.append(readLine()!.compactMap { Int(String($0)) })
    }
    var vis: [[Int]] = .init(
        repeating: .init(repeating: -1, count: w),
        count: h
    )
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    let Hdx: [Int] = [2, 2, 1, 1, -1, -1, -2, -2]
    let Hdy: [Int] = [1, -1, 2, -2, 2, -2, 1, -1]
    let Q: Queue<(Int, Int, Int)> = .init()
    vis[0][0] = k
    Q.push((0, 0, 0))
    
    var minTime: Int = -1
    while !Q.isEmpty {
        let cur = Q.front!
        Q.pop()
        
        if cur.0 == h-1, cur.1 == w-1 {
            minTime = cur.2
            break
        }
        
        for i in 0...3 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]
            if !(0..<h ~= nx) || !(0..<w ~= ny) { continue }
            if board[nx][ny] != 0 || vis[nx][ny] >= vis[cur.0][cur.1] { continue }
            vis[nx][ny] = vis[cur.0][cur.1]
            Q.push((nx, ny, cur.2 + 1))
        }
        
        if vis[cur.0][cur.1] > 0 {
            for i in 0...7 {
                let nx = cur.0 + Hdx[i]
                let ny = cur.1 + Hdy[i]
                if !(0..<h ~= nx) || !(0..<w ~= ny) { continue }
                if board[nx][ny] != 0 || vis[nx][ny] >= vis[cur.0][cur.1] - 1 { continue }
                vis[nx][ny] = vis[cur.0][cur.1] - 1
                Q.push((nx, ny, cur.2 + 1))
            }
        }
    }
    
    print(minTime)
}

solution()
