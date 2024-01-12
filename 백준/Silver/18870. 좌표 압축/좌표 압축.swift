let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var dict: [Int: Int] = [:]
var cur: Int = 0
input.sorted(by: <)
    .forEach {
        if dict[$0] == nil {
            dict[$0] = cur
            cur += 1
        }
    }

var ans = ""
input.forEach {
    ans += String(dict[$0]!) + " "
}
print(ans)