func solution() {
    let n = Int(readLine()!)!
    var count: Int = 1
    var stack: [Int] = []
    var answer: String = ""
    
    for _ in 1...n {
        let t = Int(readLine()!)!
        
        while count <= t {
            stack.append(count)
            answer += "+\n"
            count += 1
        }
        
        if stack.last! != t {
            print("NO")
            return
        }
        
        stack.removeLast()
        answer += "-\n"
    }
    
    print(answer)
}

solution()