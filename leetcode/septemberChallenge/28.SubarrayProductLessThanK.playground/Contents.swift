import Foundation
import XCTest

/*
 Subarray Product Less Than K
 
 Your are given an array of positive integers nums.

 Count and print the number of (contiguous) subarrays where the product of all the elements in the subarray is less than k.

 */

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var output = 0
        var i = 0
        var product = 1
        for j in 0..<nums.count {
            product *= nums[j]
            while i <= j && product >= k {
                product /= nums[i]
                i += 1
            }
            output += (j - i) + 1
        }

        return output
    }
}

class Solution2 {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var left = 0, right = 0
        var output = 0
        var product = 1
        while right < nums.count {
            product *= nums[right]
            while left <= right && product >= k {
                product /= nums[left]
                left += 1
            }
            output += right - left + 1
            right += 1
        }
        return output
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.numSubarrayProductLessThanK([10, 5, 2, 6], 100), 8)
    }
    
}

SolutionTests.defaultTestSuite.run()

