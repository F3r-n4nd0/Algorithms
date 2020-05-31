import Foundation
import XCTest

/*
 Maximum Product of Two Elements in an Array
 
 Given the array of integers nums, you will choose two different indices i and j of that array. Return the maximum value of (nums[i]-1)*(nums[j]-1).
 
 
 */

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let numSort = nums.sorted(by: >)
        return (numSort[0]-1) * (numSort[1]-1)
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxProduct([3,4,5,2]), 12)
    }
    
}

SolutionTests.defaultTestSuite.run()

