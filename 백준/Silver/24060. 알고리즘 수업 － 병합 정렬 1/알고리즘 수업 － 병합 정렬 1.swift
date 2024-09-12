let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0], k = nk[1]
var A: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
var tmp: [Int] = .init(repeating: -1, count: n)
var count = 0
var answer = -1

merge_sort(&A, 0, n - 1)
print(answer)

func merge(_ arr: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
    var i = p, j = q + 1, t = 0
    
    while i <= q && j <= r {
        if arr[i] <= arr[j] {
            tmp[t] = arr[i]
            t += 1
            i += 1
        } else {
            tmp[t] = arr[j]
            t += 1
            j += 1
        }
    }
    
    while i <= q {
        tmp[t] = arr[i]
        t += 1
        i += 1
    }
    
    while j <= r {
        tmp[t] = arr[j]
        t += 1
        j += 1
    }
    
    i = p
    t = 0
    
    while i <= r {
        count += 1
        if count == k { answer = tmp[t] }
        arr[i] = tmp[t]
        i += 1
        t += 1
    }
}

func merge_sort(_ arr: inout [Int], _ p: Int, _ r: Int) {
    if p < r {
        let q = (p + r) / 2
        merge_sort(&arr, p, q)
        merge_sort(&arr, q + 1, r)
        merge(&arr, p, q, r)
    }
}