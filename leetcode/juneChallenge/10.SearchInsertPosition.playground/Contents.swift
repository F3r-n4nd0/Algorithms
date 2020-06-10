import Foundation
import XCTest

/*
 Search Insert Position
 
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.last ?? 0 < target { return nums.count  }
        if nums.first ?? 0 > target { return 0 }
        var left = 0, right = nums.count-1
        while left < right {
            let mid = (left + right) >> 1
            let midVal = nums[mid]
            if  midVal == target { return mid }
            if target > midVal  {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return right
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.searchInsert([1,3,5,6], 5), 2)
        XCTAssertEqual(solution.searchInsert([1,3,5,6], 2), 1)
        XCTAssertEqual(solution.searchInsert([1,3,5,6], 7), 4)
    }
    
}

SolutionTests.defaultTestSuite.run()

