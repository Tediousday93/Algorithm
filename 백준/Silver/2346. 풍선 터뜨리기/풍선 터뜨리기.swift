var dat: [Int] = .init(repeating: -1, count: 1005)
var pre: [Int] = .init(repeating: -1, count: 1005)
var nxt: [Int] = .init(repeating: -1, count: 1005)
var unused: Int = 1

func insert(addr: Int, data: Int) {
    dat[unused] = data
    pre[unused] = addr
    nxt[unused] = nxt[addr]
    if nxt[addr] != -1 {
        pre[nxt[addr]] = unused
    }
    nxt[addr] = unused
    unused += 1
}

func erase(addr: Int) {
    nxt[pre[addr]] = nxt[addr]
    if nxt[addr] != -1 {
        pre[nxt[addr]] = pre[addr]
    }
}

let n = Int(readLine()!)!
for addr in 0...n-1 {
    insert(addr: addr, data: addr+1)
}
pre[1] = n
nxt[n] = 1
var cur: Int = 0
var removed: [String] = []
var input = "1 " + readLine()!
var moveCount = input.split(separator: " ").compactMap { Int($0) }

func moveCur(count: Int) {
    if count < 0 {
        for _ in 1...(-count) {
            cur = pre[cur]
        }
    } else {
        for _ in 1...count {
            cur = nxt[cur]
        }
    }
}

for _ in 1...n {
    moveCur(count: moveCount[cur])
    erase(addr: cur)
    removed.append(String(dat[cur]))
}

print(removed.joined(separator: " "))