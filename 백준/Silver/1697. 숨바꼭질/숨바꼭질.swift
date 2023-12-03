final class Queue<T> {
    var arr: [T]
    var head: Int = 0
    var tail: Int = 0
    
    init(arr: [T]) {
        self.arr = arr
    }
    
    var front: T { arr[head] }
    var back: T { arr[tail-1] }
    var isEmpty: Bool { head == tail }
    
    func push(_ x: T) {
        arr[tail] = x
        tail += 1
    }
    
    func pop() {
        head += 1
    }
}

func solution() {
    let nk = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let n = nk[0]
    let k = nk[1]
    let Q: Queue<Int> = .init(arr: .init(repeating: -1, count: 200001))
    var time: [Int] = .init(repeating: -1, count: 200001)
    
    time[n] = 0
    Q.push(n)
    
    while time[k] == -1 {
        let cur = Q.front
        Q.pop()
        let nx = [cur-1, cur+1, cur*2]
        
        for x in nx {
            if !(0...200000 ~= x) { continue }
            if time[x] != -1 { continue }
            time[x] = time[cur]+1
            Q.push(x)
        }
    }
    
    print(time[k])
}

solution()