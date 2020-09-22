import Foundation
import XCTest

/*
 Move Zeroes
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 */

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0, count = 0
        while i < nums.count - count {
            let num = nums[i]
            if num == 0 {
                nums.remove(at: i)
                nums.append(num)
                count += 1
                continue
            }
            i += 1
        }
    }
}

class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        var currentIndex = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[currentIndex] = nums[i]
                currentIndex += 1
            }
        }
        for i in currentIndex..<nums.count {
            nums[i] = 0
        }
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        var arr = [0,1,0,3,12]
        solution.moveZeroes(&arr)
        XCTAssertEqual(arr, [1,3,12,0,0])
    }
    
}

SolutionTests.defaultTestSuite.run()

