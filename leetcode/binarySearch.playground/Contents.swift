import Foundation
import XCTest

/*
 Binary Search
 
 Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums. If target exists, then return its index, otherwise return -1.
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        var left = 0, right = nums.count-1
        while left <= right {
            let mid = (left+right)>>1
            if nums[mid] == target { return mid }
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}

class Solution2 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return nums.firstIndex(of: target) ?? -1
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.search([-1,0,3,5,9,12], 9), 4)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.search([-1,0,3,5,9,12], 2), -1)
    }
    
}

SolutionTests.defaultTestSuite.run()

