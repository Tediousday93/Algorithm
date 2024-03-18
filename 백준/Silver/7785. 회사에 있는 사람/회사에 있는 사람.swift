var set: Set<String> = []
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if input[1] == "enter" {
        set.insert(input[0])
    } else {
        set.remove(input[0])
    }
}
var ans = ""
set.sorted(by: >)
    .forEach { ans += $0 + "\n" }
print(ans)