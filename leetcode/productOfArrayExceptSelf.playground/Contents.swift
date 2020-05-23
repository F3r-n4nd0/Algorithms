import UIKit
import XCTest

//Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prod = 1
        var result = Array(repeating: 1, count: nums.count)
        for i in 0..<nums.count{
            result[i] = prod
            prod *= nums[i]
        }
        prod = 1
        for i in stride(from: nums.count - 1, to: -1, by: -1){
            result[i] *= prod
            prod *= nums[i]
        }
        return result
    }
}


class SolutionTests: XCTestCase {
    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
    }

    func testExampleOne() {
        XCTAssertEqual(solution.productExceptSelf([1,2,3,4]), [24,12,8,6])
        XCTAssertEqual(solution.productExceptSelf([1,0]), [0,1])
    }
}

SolutionTests.defaultTestSuite.run()

