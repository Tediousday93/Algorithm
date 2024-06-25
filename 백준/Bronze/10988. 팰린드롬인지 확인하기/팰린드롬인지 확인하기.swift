let characters = readLine()!.map { String($0) }
let reversed: [String] = characters.reversed()
if characters == reversed {
    print(1)
} else {
    print(0)
}