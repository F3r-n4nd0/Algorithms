import Foundation
import XCTest

/*
 Contains Duplicate
 
 Given an array of integers, find if the array contains any duplicates.

 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

 */

class Solution {
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dic = Dictionary<Int,Int>()
        for num in nums {
            if dic[num] ?? 0 >= 1 { return true }
            dic[num, default: 0] += 1
        }
        return false
    }
    
}

class Solution2 {
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) { return true }
            set.insert(num)
        }
        return false
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.containsDuplicate([1,2,3,1]), true)
    }
    
}

SolutionTests.defaultTestSuite.run()

