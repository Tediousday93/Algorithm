var ans = ""
while let input = readLine() {
    let ab = input.split(separator: " ").compactMap { Int($0) }
    ans += "\(ab[0] + ab[1])\n"
}
print(ans)