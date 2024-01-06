import UIKit

var greeting = "Hello, playground"
var arry = [7, 2, 4, 9, 10, 1]

var count = 0

for i in 0..<arry.count {
    for j in 1..<arry.count {
        print("i \(i), j \(j)")
        if j > i {
            count = j - i
        }
    }
}

print(count)
