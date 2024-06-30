let NB = readLine()!.split(separator: " ").map { String($0) }
let N = NB[0], B = Int(NB[1])!
print(Int(N, radix: B)!)