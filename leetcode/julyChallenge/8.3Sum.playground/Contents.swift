import Foundation
import XCTest

/*
 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note:
 
 The solution set must not contain duplicate triplets.
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        let nums = nums.sorted()
        var result = [[Int]]()
        var cache = Set<String>()
        for i in 0..<nums.count-2 {
            let currentValue = nums[i]
            let negativeValue = -currentValue
            var previous = Set<Int>()
            for j in (i+1..<nums.count) {
                let diff = negativeValue - nums[j]
                if previous.contains(diff) {
                    let keyValues = "\(currentValue) \(diff) \(nums[j])"
                    if !cache.contains(keyValues) {
                        result.append([currentValue, diff, nums[j]])
                        cache.insert(keyValues)
                    }
                }
                else {
                    previous.insert(nums[j])
                }
            }
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.threeSum([-1, 0, 1, 2, -1, -4]), [
            [-1, 0, 1],
            [-1, -1, 2]
        ])
    }
    
}

SolutionTests.defaultTestSuite.run()

