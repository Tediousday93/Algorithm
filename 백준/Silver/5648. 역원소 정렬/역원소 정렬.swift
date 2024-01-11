var numbers: [String] = []
var firstInput = readLine()!.split(separator: " ").map { String($0) }
let n = Int(firstInput[0])!
firstInput.removeFirst()
numbers = firstInput

while numbers.count < n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    input.forEach { numbers.append($0) }
}

var ans: [Int] = []
for num in numbers {
    var tmp = num
    
    while let last = tmp.last, last == "0" {
        tmp.removeLast()
    }
    let reversed = Int(String(tmp.reversed()))!
    ans.append(reversed)
}

print(ans.sorted(by: <).map { String($0) }.joined(separator: "\n"))