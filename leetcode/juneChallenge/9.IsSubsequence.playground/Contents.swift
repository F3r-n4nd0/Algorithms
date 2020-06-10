import Foundation
import XCTest

/*
 Is Subsequence

 Given a string s and a string t, check if s is subsequence of t.

 A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).

 Follow up:
 If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?
 
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
