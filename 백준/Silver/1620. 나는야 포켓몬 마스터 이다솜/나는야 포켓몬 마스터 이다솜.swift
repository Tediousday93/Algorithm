let NM = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = NM[0]
let m = NM[1]
var pokemonName: [Int: String] = [:]
var pokemonNum: [String: Int] = [:]

for i in 1...n {
    let name = readLine()!
    pokemonName[i] = name
    pokemonNum[name] = i
}

var ans = ""
for _ in 0..<m {
    let target = readLine()!
    if let number = Int(target) {
        ans += pokemonName[number]! + "\n"
    } else {
        ans += "\(pokemonNum[target]!)\n"
    }
}
print(ans)