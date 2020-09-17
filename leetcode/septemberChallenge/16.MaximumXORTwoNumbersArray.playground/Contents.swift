import Foundation
import XCTest

/*
 Maximum XOR of Two Numbers in an Array
 
 Given a non-empty array of numbers, a0, a1, a2, … , an-1, where 0 ≤ ai < 2^31.
 
 Find the maximum result of ai XOR aj, where 0 ≤ i, j < n.
 
 Could you do this in O(n) runtime?
 */

class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var ans = 0
        for i in stride(from: 31, through: 0, by: -1) {
            let prefixes = Set(nums.map { $0 >> i })
            print(i)
            print(prefixes.map{ String($0, radix: 2) })
            ans <<= 1
            print("ans \(ans)")
            if let _ = prefixes.first(where: { p in
                let q = p ^ (ans + 1)
                print("\(q)  <== \(p) ^ \(ans + 1)")
                return prefixes.contains(q)
            }) { ans += 1 }
        }
        return ans
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.findMaximumXOR([3, 10, 5, 25, 2, 8]), 28)
    }
    
}

SolutionTests.defaultTestSuite.run()

