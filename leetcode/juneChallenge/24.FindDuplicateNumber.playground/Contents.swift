import Foundation
import XCTest

/*
 Find the Duplicate Number
 
 Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.
 */

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = nums[nums[0]]
        var slow = nums[0]
        while fast != slow {
            fast = nums[nums[fast]]
            slow = nums[slow]
        }
        slow = 0
        while fast != slow {
            fast = nums[fast]
            slow = nums[slow]
        }
        return slow
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.findDuplicate([2,2,2,2,2]), 2)
        XCTAssertEqual(solution.findDuplicate([1,1]), 1)
        XCTAssertEqual(solution.findDuplicate([1,3,4,2,2]), 2)
        XCTAssertEqual(solution.findDuplicate([3,1,3,4,2]), 3)
        
    }
    
}

SolutionTests.defaultTestSuite.run()

