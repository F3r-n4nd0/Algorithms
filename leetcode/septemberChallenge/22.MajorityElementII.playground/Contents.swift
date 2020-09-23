import Foundation
import XCTest

/*
 Majority Element II
 
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

 Note: The algorithm should run in linear time and in O(1) space.
 
 */

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        let n = nums.count/3
        var output = [Int]()
        var checkNums = [Int:Int]()
        for num in nums {
            checkNums[num, default:0] += 1
            if let quantity = checkNums[num] {
                if quantity == n+1 {
                    output.append(num)
                }
            }
        }
        return output
     }
}

class Solution2 {
    func majorityElement(_ nums: [Int]) -> [Int] {
        let checkNums = nums.reduce(into: [Int:Int]()) { $0[$1, default: 0] += 1 }
        let n = nums.count / 3
        return checkNums.compactMap{ $0.value > n ? $0.key : nil }
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.majorityElement([3,2,3]), [3])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.majorityElement([1,1,1,3,3,2,2,2]), [1,2])
    }
    
}

SolutionTests.defaultTestSuite.run()

