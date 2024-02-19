let addingFormulas = readLine()!.split(separator: "-").map { String($0) }

func excuteAdding(formula: String) -> Int {
    formula.split(separator: "+")
    .compactMap { Int($0) }
    .reduce(0, +)
}

let operands = addingFormulas.map { excuteAdding(formula: $0) }
var answer = operands.first! * 2
answer = operands.reduce(answer, -)

print(answer)