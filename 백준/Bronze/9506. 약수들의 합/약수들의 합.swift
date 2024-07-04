while let input = readLine(), let number = Int(input), number != -1 {
    var measures: [Int] = []
    for divider in 1...(number / 2) {
        if number % divider == 0 { measures.append(divider) }
    }
    let sum = measures.reduce(0, +)
    var text = "\(number)"
    if sum == number {
        text += " = " + measures.map(String.init).joined(separator: " + ")    
    } else {
        text += " is NOT perfect."
    }
    print(text)
}