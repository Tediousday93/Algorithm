func solution() {
    let n = Int(readLine()!)!
    var numberSet: [Int] = []
    for _ in 0..<n {
        numberSet.append(Int(readLine()!)!)
    }
    numberSet.sort(by: >)
    
    var twoElementSums: [Int] = []
    for x in 0..<n {
        for y in x..<n {
            twoElementSums.append(numberSet[x] + numberSet[y])
        }
    }
    twoElementSums.sort()
    
    for number in numberSet {
        for j in stride(from: 0, to: n, by: 1) {
            if isContaining(number - numberSet[j], in: twoElementSums) {
                print(number)
                return
            }
        }
    }
    
    func isContaining(_ x: Int, in arr: [Int]) -> Bool {
        var start = 0
        var end = arr.count - 1
        var mid: Int { (start + end) / 2 }
        
        while start <= end {
            if arr[mid] > x {
                end = mid - 1
            } else if arr[mid] < x {
                start = mid + 1
            } else {
                return true
            }
        }
        
        return false
    }
}
solution()