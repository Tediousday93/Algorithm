let n = Int(readLine()!)!
var d: [Int] = .init(repeating: 0, count: n+1)
var arr: [Int] = []
var point: Int = 0
for i in 1...n {
    arr.append(Int(readLine()!)!)
    point += arr[i-1]
}

if n > 3 {
    d[1] = arr[0]
    d[2] = arr[1]
    d[3] = arr[2]
    for i in 4...n {
        d[i] = min(d[i-2], d[i-3]) + arr[i-1]
    }
    point -= min(d[n-1], d[n-2])
} else if n == 3 {
    point -= min(arr[0], arr[1])
}
print(point)