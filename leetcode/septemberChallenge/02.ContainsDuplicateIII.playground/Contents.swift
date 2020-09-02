import Foundation
import XCTest

/*
 Contains Duplicate III
 
 Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k.
 */

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        for i in 0..<nums.count {
            for j in i+1..<min(nums.count, i+1+k) {
                if abs(nums[i] - nums[j]) <= t {
                    return true
                }
            }
        }
        return false
    }
}

class Solution2 {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var setNums = Set<Int>()
        for i in 0..<nums.count {
            if t == 0 {
                guard !setNums.contains(nums[i]) else { return true }
            } else {
                guard !setNums.contains(where: { abs($0 - nums[i]) <= t }) else { return true }
            }
            setNums.insert(nums[i])
            if i >= k { setNums.remove(nums[i - k]) }
        }
        return false
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0), true)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.containsNearbyAlmostDuplicate([0], 0, 0), false)
    }
    
}

SolutionTests.defaultTestSuite.run()

