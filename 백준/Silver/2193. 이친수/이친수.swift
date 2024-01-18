let n = Int(readLine()!)!
var d: [[Int]] = [[0, 0], [0, 1], [1, 0], [1, 1]]

while d.count <= n {
    let i = d.count
    let prevZero = d[i-1][0]
    let prevOne = d[i-1][1]
    d.append([prevZero+prevOne, prevZero])
}

print(d[n][0] + d[n][1])