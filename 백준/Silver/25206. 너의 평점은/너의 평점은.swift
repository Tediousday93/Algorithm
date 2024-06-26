import Foundation

enum Grade: String {
    case aPlus = "A+"
    case aZero = "A0"
    case bPlus = "B+"
    case bZero = "B0"
    case cPlus = "C+"
    case cZero = "C0"
    case dPlus = "D+"
    case dZero = "D0"
    case fail = "F"
    case pass = "P"

    var point: Double {
        switch self {
        case .aPlus: return 4.5
        case .aZero: return 4.0
        case .bPlus: return 3.5
        case .bZero: return 3.0
        case .cPlus: return 2.5
        case .cZero: return 2.0
        case .dPlus: return 1.5
        case .dZero: return 1.0
        case .fail: return 0.0
        case .pass: return .nan
        }
    }
}
let formatter = NumberFormatter()
formatter.numberStyle = .decimal
formatter.maximumFractionDigits = 6
formatter.roundingMode = .halfUp

var subjectPointSum = 0.0
var totalPoint = 0.0

for _ in 0..<20 {
    let input = readLine()!.split(separator: " ").map(String.init)
    let subjectPoint = Double(input[1])!, grade = Grade(rawValue: input[2])!
    if grade == .pass { continue }
    subjectPointSum += subjectPoint
    totalPoint += subjectPoint * grade.point
}
print(formatter.string(from: totalPoint / subjectPointSum as NSNumber)!)