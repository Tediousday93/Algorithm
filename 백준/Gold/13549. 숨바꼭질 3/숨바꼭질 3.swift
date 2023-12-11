final class Queue<T> {
    var arr: [T] = []
    var head: Int = 0
    var front: T { return arr[head] }
    var isEmpty: Bool { arr.count <= head }
    func push(_ t: T) {
        arr.append(t)
    }
    func pop() {
        head += 1
    }
}

let NK = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = NK[0]
let k = NK[1]
var time: [Int] = .init(repeating: -1, count: 200007)
let Q: Queue<Int> = .init()
time[n] = 0
Q.push(n)

while time[k] == -1 {
    let cur = Q.front
    Q.pop()
    let dx = [cur * 2, cur - 1, cur + 1]
    for i in 0...2 {
        let nx = dx[i]
        if !(0...200006 ~= nx) || time[nx] != -1 { continue }
        if i != 0 {
            time[nx] = time[cur] + 1
        } else {
            time[nx] = time[cur]
        }
        Q.push(nx)
    }
}

print(time[k])