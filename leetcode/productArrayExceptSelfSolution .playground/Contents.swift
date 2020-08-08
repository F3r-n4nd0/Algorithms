import Foundation
import XCTest

/*
 Product of Array Except Self

 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 */

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 1, count: nums.count)
        var sumRight = 1, sumLeft = 1
        for i in 1..<nums.count {
            sumRight *= nums[i-1]
            result[i] *= sumRight
            sumLeft *=  nums[nums.count-i]
            result[nums.count-i-1] *= sumLeft
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.productExceptSelf([1,2,3,4]), [24,12,8,6])
    }

    func testExampleTwo() {
        XCTAssertEqual(solution.productExceptSelf([1,0]), [0,1])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.productExceptSelf([4,5,1,8,2]), [80, 64, 320, 40, 160])
    }
    
}

SolutionTests.defaultTestSuite.run()

