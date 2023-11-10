var data: [Int] = .init(repeating: -1, count: 5005)
var pre: [Int] = .init(repeating: -1, count: 5005)
var nxt: [Int] = .init(repeating: -1, count: 5005)
var unused: Int = 1

func insert(dat: Int, addr: Int) {
    data[unused] = dat
    pre[unused] = addr
    nxt[unused] = nxt[addr]
    if nxt[addr] != -1 {
        pre[nxt[addr]] = unused
    }
    nxt[addr] = unused
    unused += 1
}

func remove(addr: Int) {
    nxt[pre[addr]] = nxt[addr]
    if nxt[addr] != -1 {
        pre[nxt[addr]] = pre[addr]
    }
}

let input = readLine()!.split(separator: " ").compactMap { Int($0) }

for n in 0...(input[0] - 1) {
    insert(dat: n+1, addr: n)
}

pre[1] = input[0]
nxt[input[0]] = 1
var cur: Int = 0
var nums: [String] = []

while nxt[cur] != cur {
    for _ in 0...(input[1] - 1) {
        cur = nxt[cur]
    }
    nums.append(String(data[cur]))
    remove(addr: cur)
}

let output = "<" + nums.joined(separator: ", ") + ">"
print(output)