struct Member {
    let age: Int
    let name: String
    let number: Int
}

let n = Int(readLine()!)!
var members: [Member] = []
for i in 0..<n {
    let input = readLine()!.split(separator: " ")
    members.append(Member(age: Int(input[0])!, name: String(input[1]), number: i))
}
members.sort { $0.age != $1.age ? $0.age < $1.age : $0.number < $1.number }

var ans = ""
for member in members {
    ans += "\(member.age) \(member.name)\n"
}
print(ans)