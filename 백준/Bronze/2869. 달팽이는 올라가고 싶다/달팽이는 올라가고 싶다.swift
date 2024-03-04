func solution() {
    let abv = readLine()!.split(separator: " ").compactMap { Int($0) }
    let a = abv[0]
    let b = abv[1]
    var v = abv[2]
    v -= a
    if v <= 0 {
        print(1)
        return
    }
    let aDayBefore = v / (a - b) + (v % (a - b) == 0 ? 0 : 1)
    if aDayBefore == 0 {
        print(2)
    } else {
        print(aDayBefore + 1)
    }
}
solution()