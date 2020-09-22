import Foundation
import XCTest

/*
 Find All Numbers Disappeared in an Array
 
 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements of [1, n] inclusive that do not appear in this array.

 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 */

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        var nums = nums
        var output = [Int]()
        for i in 0..<nums.count {
            let n = abs(nums[i])
            if nums[n-1] > 0 { nums[n-1] *= -1  }
        }
        for i in 0..<nums.count {
            if nums[i] > 0 { output.append(i+1) }
        }
        return output
    }
}

class Solution2 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var output = [Int]()
        var nums = nums
        var i = 0
        while i < nums.count {
            let k = i
            var t = nums[k]
            while k != t - 1 && nums[k] != nums[t - 1] {
                t = nums[k]
                nums[k] = nums[t - 1]
                nums[t - 1] = t
            }
            i = k + 1
        }
        for i in 0..<nums.count where nums[i] != i + 1 {
            output.append(i + 1)
        }
        return output
    }
}


class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.findDisappearedNumbers([4,3,2,7,8,2,3,1]), [5,6])
    }
    
    func testExamplTwo() {
        XCTAssertEqual(solution.findDisappearedNumbers([4,3,2,7,8,2,3,1]), [5,6])
    }
    
    func testExamplThree() {
        XCTAssertEqual(solution.findDisappearedNumbers([1,1]), [2])
    }
    
}

SolutionTests.defaultTestSuite.run()

