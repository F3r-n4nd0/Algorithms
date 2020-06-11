import Foundation
import XCTest

/*
 Sort Colors
 
 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
 
 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
 
 Note: You are not suppose to use the library's sort function for this problem.
 
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        var left = 0, right = nums.count-1
        while left <= right {
            switch nums[left] {
            case 0:
                nums.remove(at: left)
                nums.insert(0, at: 0)
                left += 1
                break
            case 1:
                left += 1
                break
            case 2:
                nums.remove(at: left)
                nums.append(2)
                right -= 1
                break
            default: return
            }
        }
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        var arr = [2,0,2,1,1,0]
        solution.sortColors(&arr)
        XCTAssertEqual(arr, [0,0,1,1,2,2])
    }
    
}

SolutionTests.defaultTestSuite.run()

