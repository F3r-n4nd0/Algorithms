import Foundation
import XCTest

/*
 Top K Frequent Elements
 
 Given a non-empty array of integers, return the k most frequent elements.
 */

class Solution {
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let numsFrequency = nums.reduce(into: [Int:Int]()) { $0[$1, default:0] += 1}
        let sortNumsFrequency = numsFrequency.sorted{ $0.value > $1.value }
        return sortNumsFrequency.prefix(k).map({ $0.key })
    }
    
}

class Solution2 {
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count >= 2 else { return [nums[0]] }
        let dict = nums.reduce(into: [Int:Int]()) { $0[$1, default: 0] += 1 }
        var freq = dict.map({ ($0.key, $0.value) })
        let n = freq.count
        let k = n - k
        var lo = 0
        var hi = n - 1
        while lo < hi {
            let p = partition(&freq, lo, hi)
            if p == k {
                break
            } else if p > k {
                hi = p - 1
            } else {
                lo = p + 1
            }
        }
        var result = [Int]()
        for i in k..<n {
            result.append(freq[i].0)
        }
        return result
    }
    
    private func partition(_ nums: inout [(Int,Int)], _ lo: Int, _ hi: Int) -> Int {
        let p = nums[lo].1
        var i = lo + 1
        var j = hi
        
        while true {
            while i < hi, nums[i].1 < p {
                i += 1
            }
            while lo < j, p < nums[j].1 {
                j -= 1
            }
            if i >= j {
                break
            }
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
        nums.swapAt(lo, j)
        return j
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.topKFrequent([1,1,1,2,2,3], 2), [1,2])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.topKFrequent([1], 1), [1])
    }
    
}

SolutionTests.defaultTestSuite.run()

