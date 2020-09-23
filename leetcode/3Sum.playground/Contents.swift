import Foundation
import XCTest

/*
 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Notice that the solution set must not contain duplicate triplets.
 
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        let nums = nums.sorted(by: <)
        var output = [[Int]]()
        for i in 0..<nums.count-2 where i == 0 || ( i > 0 && nums[i] != nums[i-1] ) {
            var left = i+1, rigth = nums.count-1
            while left < rigth {
                if nums[i] + nums[left] + nums[rigth] == 0 {
                    output.append([nums[i], nums[left], nums[rigth]])
                    repeat {
                        rigth -= 1
                    } while left < rigth && nums[rigth+1] == nums[rigth]
                    repeat {
                        left += 1
                    } while left < rigth && nums[left-1] == nums[left]
                } else if 0-nums[i] > nums[left] + nums[rigth] {
                    left += 1
                } else {
                    rigth -= 1
                }
            }
        }
        return output
    }
}

class Solution2 {
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
        XCTAssertEqual(solution.threeSum([-1,0,1,2,-1,-4]), [[-1,-1,2],[-1,0,1]])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.threeSum([0,0,0]), [[0,0,0]])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.threeSum([3,0,-2,-1,1,2]), [[-2,-1,3],[-2,0,2],[-1,0,1]])
    }
    
}

SolutionTests.defaultTestSuite.run()

