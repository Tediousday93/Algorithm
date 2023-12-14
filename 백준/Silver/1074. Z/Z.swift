let Nrc = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = Nrc[0]
let r = Nrc[1]
let c = Nrc[2]

func visit(row: Int, column: Int, k: Int) -> Int {
    if k == 0 { return 0 }
    let half: Int = 1 << (k-1)
    if row < half && column < half { return visit(row: row, column: column, k: k-1) }
    if row < half && column >= half { return half * half + visit(row: row, column: column-half, k: k-1) }
    if row >= half && column < half { return half * half * 2 + visit(row: row-half, column: column, k: k-1) }
    return half * half * 3 + visit(row: row-half, column: column-half, k: k-1)
}

print(visit(row: r, column: c, k: N))