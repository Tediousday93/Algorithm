let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var arr: [String] = {
    var n: [String] = []
    for i in 1...input[0] {
        n.append(String(i))
    }
    return n
}()

func swap(from i: Int, to j: Int) {
    for num in i...((i+j)/2) {
        arr.swapAt(num-1, i+j-num-1)
    }
}

for _ in 1...input[1] {
    let r = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    swap(from: r[0], to: r[1])
}

let result = arr.joined(separator: " ")
print(result)