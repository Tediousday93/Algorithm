enum Coin: Int, CaseIterable {
    case quarter = 25
    case dime = 10
    case nickel = 5
    case penny = 1
}

let t = Int(readLine()!)!
var answers: [String] = []
for _ in 0..<t {
    let change = Int(readLine()!)!
    answers.append(coinList(for: change).map({ String($0) }).joined(separator: " "))
}
print(answers.joined(separator: "\n"))

func coinList(for change: Int) -> [Int] {
    var list: [Int] = []
    var change = change
    Coin.allCases.forEach {
        list.append(change / $0.rawValue)
        change = change % $0.rawValue
    }
    return list
}