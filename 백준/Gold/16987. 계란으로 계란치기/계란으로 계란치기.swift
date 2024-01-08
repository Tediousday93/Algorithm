let n = Int(readLine()!)!
var sList: [Int] = []
var wList: [Int] = []
var isBroken: [Bool] = .init(repeating: false, count: n)
for _ in 0..<n {
    let sw = readLine()!.split(separator: " ").compactMap { Int($0) }
    sList.append(sw[0])
    wList.append(sw[1])
}
var ans: [Int] = []

func solution(k: Int, S: [Int]) {
    if k == n {
        var count = 0
        isBroken.forEach {
            if $0 { count += 1 }
        }
        ans.append(count)
        return
    }
    
    if isBroken[k] {
        solution(k: k+1, S: S)
        return
    }
    
    var s = S
    var brokenEggs = 0
    
    for index in 0..<n {
        if k == index { continue }
        if isBroken[index] {
            brokenEggs += 1
            continue
        }
        
        s[k] -= wList[index]
        s[index] -= wList[k]
        s[k] <= 0 ? (isBroken[k] = true) : (isBroken[k] = false)
        s[index] <= 0 ? (isBroken[index] = true) : (isBroken[index] = false)
        solution(k: k+1, S: s)
        s[k] += wList[index]
        s[index] += wList[k]
        s[k] <= 0 ? (isBroken[k] = true) : (isBroken[k] = false)
        s[index] <= 0 ? (isBroken[index] = true) : (isBroken[index] = false)
    }
    
    if brokenEggs == n-1 {
        ans.append(n-1)
    }
}

solution(k: 0, S: sList)
print(ans.max()!)