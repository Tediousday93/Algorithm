let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var isUsed: [Bool] = .init(repeating: false, count: n)
var arr: [Int] = .init(repeating: 0, count: m)

func combination(k: Int) {
    if k == m {
        print(arr.map({ String($0) }).joined(separator: " "))
        return
    }

    var start: Int = 0
    if k != 0 { start = arr[k-1] }

    for i in start..<n {
        if !isUsed[i] {
            arr[k] = i+1
            isUsed[i] = true
            combination(k: k+1)
            isUsed[i] = false
        }
    }
}

combination(k: 0)