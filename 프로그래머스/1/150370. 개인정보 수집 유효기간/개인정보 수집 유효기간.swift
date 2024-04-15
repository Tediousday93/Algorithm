import Foundation

let dayInMonth = 28
let dayInYear = 28 * 12

func getDays(of date: String) -> Int {
    let dayInfo = date.split(separator: ".").compactMap { Int($0) }
    return (dayInfo[0] * dayInYear) + (dayInfo[1] * dayInMonth) + dayInfo[2]
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answer: [Int] = []
    let today = getDays(of: today)
    
    var termDict: [String: Int] = [:]
    terms.forEach { term in
        let info = term.split(separator: " ").map { String($0) }
        termDict[info[0]] = Int(info[1])!
    }
    
    func makeExpirationDays(startDays: Int, kind: String) -> Int {
        let expiration = termDict[kind]! * dayInMonth
        var expirationDays = startDays + expiration - 1
        return expirationDays
    }
    
    for (index, privacy) in privacies.enumerated() {
        let dateAndKind = privacy.split(separator: " ").map { String($0) }
        let startDays = getDays(of: dateAndKind[0])
        let expirationDays = makeExpirationDays(
            startDays: startDays,
            kind: dateAndKind[1]
        )
        if expirationDays < today {
            answer.append(index + 1)
        }
    }
    
    return answer
}