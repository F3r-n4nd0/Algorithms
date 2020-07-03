import Foundation
import XCTest

/*
 Single Number
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

 Note:

 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 */

class Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(into: 0,^=)
    }
    
}

class Solution2 {
    
    func singleNumber(_ nums: [Int]) -> Int {
        var dict:[Int:Int] = [:]
        for i in 0..<nums.count {
            if let value = dict[nums[i]] {
                dict[nums[i]] = nil
            } else {
                dict[nums[i]] = 1
            }
        }
        for item in dict {
            return item.key
        }
        return -1
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution2!
    
    override func setUp() {
        super.setUp()
        solution = Solution2()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.singleNumber([2,2,1]), 1)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.singleNumber([4,1,2,1,2]), 4)
    }
    
}

SolutionTests.defaultTestSuite.run()

