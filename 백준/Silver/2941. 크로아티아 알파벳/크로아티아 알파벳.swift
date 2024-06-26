import Foundation

var text = readLine()!
let mapping = ["c=", "c-", "dz=", "d-",
               "lj", "nj", "s=", "z="]
for sign in mapping {
    text = text.replacingOccurrences(of: sign, with: ".")
}
print(text.count)