var dictionary: [String: String] = [:]
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    dictionary[input[0]] = input[1]
}

var ans = ""
dictionary.filter { $0.value == "enter" }
    .sorted(by: { $0.key > $1.key })
    .forEach { ans += $0.key + "\n" }
print(ans)