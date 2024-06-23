enum Dial: String {
    case A, B, C, D, E, F, G, H, I, J, K, L, M
    case N, O, P, Q, R, S, T, U, V, W, X, Y, Z

    var time: Int {
        switch self {
        case .A, .B, .C: return 3
        case .D, .E, .F: return 4
        case .G, .H, .I: return 5
        case .J, .K, .L: return 6
        case .M, .N, .O: return 7
        case .P, .Q, .R, .S: return 8
        case .T, .U, .V: return 9
        case .W, .X, .Y, .Z: return 10
        }
    }
}
let words = readLine()!.map { String($0) }
var total = 0
for char in words {
    if let dial = Dial(rawValue: char) {
        total += dial.time
    }
}
print(total)