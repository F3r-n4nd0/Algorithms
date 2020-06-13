import Foundation
import XCTest

/*
 Largest Divisible Subset
 
 Given a set of distinct positive integers, find the largest subset such that every pair (Si, Sj) of elements in this subset satisfies:

 Si % Sj = 0 or Sj % Si = 0.

 If there are multiple solutions, return any subset is fine.

 */

class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        var result = nums.map{ [$0] }
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] % nums[j] == 0 && result[i].count <= result[j].count {
                    result[i] = result[j] + [nums[i]]
                }
            }
        }
        return result.max{ $0.count < $1.count } ?? []
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.largestDivisibleSubset([1,2,4,8,16]),[1,2,4,8,16])
        XCTAssertEqual(solution.largestDivisibleSubset([1]), [1])
        XCTAssertEqual(solution.largestDivisibleSubset([1,2,4,8]), [1,2,4,8])
        XCTAssertEqual(solution.largestDivisibleSubset([1,2,3]), [1,2])
    }
    
}

SolutionTests.defaultTestSuite.run()


