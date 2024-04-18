let n = Int(readLine()!)!
var lc: [Int] = .init(repeating: -1, count: n + 1)
var rc: [Int] = .init(repeating: -1, count: n + 1)

var preResult: [Int] = []
var inResult: [Int] = []
var postResult: [Int] = []

func toIndex(char: Character) -> Int {
    return Int(char.asciiValue!) - Int(Character("A").asciiValue!) + 1
}

func toString(index: Int) -> String {
    return String(UnicodeScalar(index - 1 + Int(Character("A").asciiValue!))!)
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (cur, left, right) = (input[0], input[1], input[2])
    if left != "." {
        lc[toIndex(char: Character(cur))] = toIndex(char: Character(left))
    }
    if right != "." {
        rc[toIndex(char: Character(cur))] = toIndex(char: Character(right))
    }
}

func preorder(cur: Int) {
    preResult.append(cur)
    if lc[cur] != -1 { preorder(cur: lc[cur]) }
    if rc[cur] != -1 { preorder(cur: rc[cur]) }
}

func inorder(cur: Int) {
    if lc[cur] != -1 { inorder(cur: lc[cur]) }
    inResult.append(cur)
    if rc[cur] != -1 { inorder(cur: rc[cur]) }
}

func postorder(cur: Int) {
    if lc[cur] != -1 { postorder(cur: lc[cur]) }
    if rc[cur] != -1 { postorder(cur: rc[cur]) }
    postResult.append(cur)
}

preorder(cur: 1)
inorder(cur: 1)
postorder(cur: 1)

let preAnswer = preResult.map { toString(index: $0) }.joined()
let inAnswer = inResult.map { toString(index: $0) }.joined()
let postAnswer = postResult.map { toString(index: $0) }.joined()
print("\(preAnswer)\n\(inAnswer)\n\(postAnswer)")