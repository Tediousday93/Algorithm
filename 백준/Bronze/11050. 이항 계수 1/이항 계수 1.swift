let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
let k = nk[1]

var permutation = 1
for num in stride(from: n, through: n-k+1, by: -1) {
    permutation = permutation * num
}

var factorialK = 1
for num in stride(from: k, through: 2, by: -1) {
    factorialK = factorialK * num
}

print(permutation / factorialK)