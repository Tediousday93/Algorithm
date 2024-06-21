let AB = readLine()!.split(separator: " ").map { String($0) }
let A = Int(reverse(AB[0]))!
let B = Int(reverse(AB[1]))!
print(max(A, B))

func reverse(_ string: String) -> String {
    let characters = string.map { String($0) }
    return characters.reversed().joined()
}