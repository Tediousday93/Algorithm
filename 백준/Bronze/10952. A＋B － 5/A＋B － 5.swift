var ans = ""
while let input = readLine(), input != "0 0" {
    let ab = input.split(separator: " ").compactMap { Int($0) }
    ans += "\(ab[0] + ab[1])\n"
}
print(ans)