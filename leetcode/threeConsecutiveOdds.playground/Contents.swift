import Foundation
import XCTest

/*
 Three Consecutive Odds
 
 Given an integer array arr, return true if there are three consecutive odd numbers in the array. Otherwise, return false.
 */

class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        var count = 0
        for num in arr {
            if num % 2 != 0 {
                count += 1
                if count == 3 { return true }
            } else {
                count = 0
            }
        }
        return false
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.threeConsecutiveOdds([2,6,4,1]), false)
    }

    func testExampleTwo() {
        XCTAssertEqual(solution.threeConsecutiveOdds([1,2,34,3,4,5,7,23,12]), true)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.threeConsecutiveOdds([1,2,1,1]), false)
    }
    
    
}

SolutionTests.defaultTestSuite.run()

