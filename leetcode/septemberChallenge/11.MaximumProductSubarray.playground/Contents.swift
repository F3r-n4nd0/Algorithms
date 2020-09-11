import Foundation
import XCTest

/*
 Maximum Product Subarray
 
 Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.
 */

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }
        var maxValue = nums[0]
        var maxCurrent = nums[0]
        var minCurrent = nums[0]
        for i in 1..<nums.count {
            let tmp = maxCurrent
            maxCurrent = max(maxCurrent*nums[i], minCurrent*nums[i], nums[i])
            minCurrent = min(tmp*nums[i], minCurrent*nums[i]  , nums[i])
            if maxValue < maxCurrent { maxValue = maxCurrent }
        }
        return maxValue
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxProduct([2,3,-2,4]), 6)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.maxProduct([-2,0,-1]), 0)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.maxProduct([-2]), -2)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.maxProduct([0,2]), 2)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.maxProduct([3,-1,4]), 4)
    }
    
    func testExampleSix() {
        XCTAssertEqual(solution.maxProduct([-2,3,-4]), 24)
    }
    
    func testExampleSeven() {
        XCTAssertEqual(solution.maxProduct([3,2,2,-2,4]), 12)
    }
    
    func testExampleEight() {
        XCTAssertEqual(solution.maxProduct([4,-1,3]), 4)
    }
    
}

SolutionTests.defaultTestSuite.run()

