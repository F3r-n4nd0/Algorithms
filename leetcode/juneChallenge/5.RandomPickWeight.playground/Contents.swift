import Foundation

/*
 Random Pick with Weight
 
 Given an array w of positive integers, where w[i] describes the weight of index i, write a function pickIndex which randomly picks an index in proportion to its weight.
 
 */

class Solution {
    
    var randomChances: [Int]
    var sum: Int
    
    init(_ w: [Int]) {
        (self.randomChances, self.sum) = w.reduce(into: ([Int](),0)) {
            $0.1 += $1
            $0.0.append($0.1)
        }
    }
    
    func pickIndex() -> Int {
        let rnd = Int.random(in: 1...sum)
        return search(randomChances, rnd)
    }
    
    func search(_ arr: [Int],_ val: Int) -> Int {
        var left = 0, right = arr.count - 1
        while left < right {
            let mid = (right+left) >> 1
            if arr[mid] == val { return mid }
            else if arr[mid] < val { left = mid + 1 }
            else { right = mid }
        }
        return left
    }
    
}
