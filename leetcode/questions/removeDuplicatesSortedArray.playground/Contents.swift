import Foundation
import XCTest

/*
 Remove Duplicates from Sorted Array
 
 Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var nextIndex = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i-1] {
                nums[nextIndex] = nums[i]
                nextIndex += 1
            }
        }
        nums.removeLast(nums.count - nextIndex)
        return nextIndex
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        var arr = [0,0,1,1,1,2,2,3,3,4]
        let result = solution.removeDuplicates(&arr)
        XCTAssertEqual(result, 5)
        XCTAssertEqual(arr, [0,1,2,3,4])
    }
    
    func testExampleTwo() {
        var arr = [Int]()
        let result = solution.removeDuplicates(&arr)
        XCTAssertEqual(result, 0)
        XCTAssertEqual(arr, [])
    }
    
    func testExampleThree() {
        var arr = [1]
        let result = solution.removeDuplicates(&arr)
        XCTAssertEqual(result, 1)
        XCTAssertEqual(arr, [1])
    }
    
}

SolutionTests.defaultTestSuite.run()

