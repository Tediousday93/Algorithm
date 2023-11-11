let n = Int(readLine()!)!
var inputs = [String].init()
for _ in 1...n {
    let input = readLine()!
    inputs.append(input)
}
var count: Int = n

inputs.forEach { word in
    let tmp: [Character] = word.map { $0 }
    var occur: Set<Character> = .init()
    for index in 0...tmp.count-1 {
        if occur.contains(tmp[index]) && tmp[index-1] != tmp[index] {
            count -= 1
            break
        }
        occur.insert(tmp[index])
    }
}

print(count)