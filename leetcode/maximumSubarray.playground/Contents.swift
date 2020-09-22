import Foundation
import XCTest

/*
 Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }
        var output = nums[0]
        var currentSum = output
        for i in 1..<nums.count {
            currentSum = max(currentSum + nums[i], nums[i])
            if currentSum > output { output = currentSum }
        }
        return output
    }
}

class Solution2 {
    
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }
        return xxxxx(nums)
    }
    
    private func xxxxx(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        let mid = nums.count>>1
        let subleft = maxSubArray(Array(nums[0..<mid]))
        let subright = maxSubArray(Array(nums[mid..<nums.count]))
        var sum = nums[mid-1]
        var maxLeft = sum
        var i = mid-2
        while i >= 0 {
            sum += nums[i]
            if sum > maxLeft { maxLeft = sum }
            i -= 1
        }
        var maxRight = nums[mid]
        sum = nums[mid]
        i = mid+1
        while i < nums.count {
            sum += nums[i]
            if sum > maxRight { maxRight = sum }
            i += 1
        }
        sum = maxLeft + maxRight
        return max(subleft, subright, sum)
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]), 6)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.maxSubArray([1,2]), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()


