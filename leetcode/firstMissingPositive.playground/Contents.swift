import Foundation
import XCTest

/*
 First Missing Positive
 
 Given an unsorted integer array, find the smallest missing positive integer.
 */

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let sortNums = nums.filter{$0>0}.sorted()
        var last = 0, diff = 0
        for i in 0..<sortNums.count {
            if sortNums[i] == last {
                diff+=1
                continue
            }
            if sortNums[i] != i+1-diff {
                return i+1-diff
            }
            last = sortNums[i]
        }
        return sortNums.count + 1 - diff
    }
}

class Solution2 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 1
        }
        var nums = nums
        for i in 0..<nums.count {
            while nums[i] >= 1 && nums[i] <= nums.count && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.firstMissingPositive([1,2,0]), 3)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.firstMissingPositive([3,4,-1,1]), 2)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.firstMissingPositive([0,2,2,1,1]), 3)
    }
    
    
}

SolutionTests.defaultTestSuite.run()

