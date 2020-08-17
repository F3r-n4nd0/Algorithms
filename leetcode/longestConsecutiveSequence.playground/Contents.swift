import Foundation
import XCTest

/*
 Longest Consecutive Sequence
 
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 
 Your algorithm should run in O(n) complexity.
 */

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var map = nums.reduce(into: [:]) { $0[$1] = true }
        var result = 0
        for num in nums {
            var up = num + 1
            while let _ = map[up] {
                map.removeValue(forKey: up)
                up += 1
            }
            up -= 1
            var down = num - 1
            while let _ = map[down] {
                map.removeValue(forKey: down)
                down -= 1
            }
            down += 1
            result = max(result, up - down + 1)
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.longestConsecutive([100, 4, 200, 1, 3, 2]), 4)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.longestConsecutive([0, 0]), 1)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.longestConsecutive([0,0,-1]), 2)
    }
    
    
}

SolutionTests.defaultTestSuite.run()

