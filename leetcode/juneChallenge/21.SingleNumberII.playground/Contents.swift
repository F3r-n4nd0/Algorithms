import Foundation
import XCTest

/*
 Single Number II
 
 Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.

 Note:

 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ones = 0
        var twos = 0
        for num in nums {
            ones = (ones ^ num) & ~twos
            twos = (twos ^ num) & ~ones
        }
        return ones
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.singleNumber([2,2,3,2]), 3)
        XCTAssertEqual(solution.singleNumber([1,1,99,1,0]), 99)
        XCTAssertEqual(solution.singleNumber([4,4,4,1,0,5,5,0,5,0]), 1)
    }
    
}

SolutionTests.defaultTestSuite.run()

