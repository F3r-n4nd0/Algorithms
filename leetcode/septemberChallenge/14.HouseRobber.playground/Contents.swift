import Foundation
import XCTest

/*
 House Robber
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        guard nums.count >= 3 else { return nums.max() ?? 0 }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0],nums[1])
        for i in 2..<nums.count {
            dp[i] = max(nums[i] + dp[i-2], dp[i-1])
        }
        return dp.last ?? 0
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.rob([1,2,3,1]), 4)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.rob([2,7,9,3,1]), 12)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.rob([2,1,1,2]), 4)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.rob([2,3,2]), 4)
    }
    
}

SolutionTests.defaultTestSuite.run()

