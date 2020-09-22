import Foundation
import XCTest

/*
 Find All Duplicates in an Array
 
 Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements that appear twice in this array.

 Could you do it without extra space and in O(n) runtime?
 */

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        var numsCheck = Array(repeating: 0, count: nums.count)
        var output = [Int]()
        for num in nums {
            guard numsCheck[num-1] == 0 else  {
                output.append(num)
                continue
            }
            numsCheck[num-1] = 1
        }
        return output
    }
}

class Solution2 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var output : [Int] = []
        for num in nums {
            if nums[abs(num) - 1] < 0 {
                output.append(abs(num))
            }
            nums[abs(num) - 1] *= -1
        }
        return output
    }
}


class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.findDuplicates([4,3,2,7,8,2,3,1]), [2,3])
    }
}

SolutionTests.defaultTestSuite.run()

