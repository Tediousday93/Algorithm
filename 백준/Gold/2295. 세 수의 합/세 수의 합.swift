func solution() {
    let n = Int(readLine()!)!
    var numberSet: [Int] = []
    for _ in 0..<n {
        numberSet.append(Int(readLine()!)!)
    }
    numberSet.sort(by: >)
    
    var twoElementSums: Set<Int> = []
    for x in 0..<n {
        for y in x..<n {
            twoElementSums.insert(numberSet[x] + numberSet[y])
        }
    }
    
    for number in numberSet {
        for j in stride(from: 0, to: n, by: 1) {
            if twoElementSums.contains(number - numberSet[j]) {
                print(number)
                return
            }
        }
    }
}
solution()