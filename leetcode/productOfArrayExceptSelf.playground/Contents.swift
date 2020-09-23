import UIKit
import XCTest

/*
 Product of Array Except Self

 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 */

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        var output = Array(repeating: 1, count: nums.count)
        var prod = nums[0]
        for i in 1..<nums.count{
            output[i] = prod
            prod *= nums[i]
        }
        prod = nums[nums.count-1]
        for i in stride(from: nums.count - 2, to: -1, by: -1){
            output[i] *= prod
            prod *= nums[i]
        }
        return output
    }
}

class Solution2 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        var output = Array(repeating: 1, count: nums.count)
        var sumRight = nums[0] , sumLeft = nums[nums.count-1]
        output[1] *= sumRight
        output[nums.count-2] *= sumLeft
        for i in 2..<nums.count {
            sumRight *= nums[i-1]
            output[i] *= sumRight
            sumLeft *=  nums[nums.count-i]
            output[nums.count-i-1] *= sumLeft
        }
        return output
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.productExceptSelf([1,2,3,4]), [24,12,8,6])
    }

    func testExampleTwo() {
        XCTAssertEqual(solution.productExceptSelf([1,0]), [0,1])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.productExceptSelf([4,5,1,8,2]), [80, 64, 320, 40, 160])
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.productExceptSelf([9,0,-2]), [0,-18,0])
    }
}

SolutionTests.defaultTestSuite.run()

