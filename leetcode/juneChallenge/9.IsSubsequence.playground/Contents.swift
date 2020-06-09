import Foundation
import XCTest

/*
 
 */

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty { return true }
        var position = 0
        for char in t {
            if char == s[s.index(s.startIndex, offsetBy: position)] {
                position += 1
                if position == s.count { return true }
            }
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
        XCTAssertEqual(solution.isSubsequence("abc", "ahbgdc"), true)
        XCTAssertEqual(solution.isSubsequence("", "ahbgdc"), true)
        XCTAssertEqual(solution.isSubsequence("b", "c"), false)
    }
    
}

SolutionTests.defaultTestSuite.run()
