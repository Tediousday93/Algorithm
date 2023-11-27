while true {
    let input = readLine()!
    if input == "." { break }
    var stack: [Character] = []
    var isValanced = true
    
    for char in input {
        if char == "(" || char == "[" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty || stack.last! != "(" {
                isValanced = false
                break
            } else {
                stack.removeLast()
            }
        } else if char == "]" {
            if stack.isEmpty || stack.last != "[" {
                isValanced = false
                break
            } else {
                stack.removeLast()
            }
        }
    }
    
    if stack.isEmpty == false { isValanced = false }
    isValanced ? print("yes") : print("no")
}