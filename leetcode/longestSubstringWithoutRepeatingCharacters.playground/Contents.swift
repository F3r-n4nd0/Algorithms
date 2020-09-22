import Foundation
import XCTest

/*
 Longest Substring Without Repeating Characters
 
 Given a string s, find the length of the longest substring without repeating characters.
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let s = Array(s)
        var longestSubstring = 0
        var left = 0, right = 0
        var charIndexes = [Character:Int]()
        while right < s.count {
            if let index = charIndexes[s[right]] {
                if index > left { left = index }
            }
            let currentLen = right-left+1
            if currentLen > longestSubstring { longestSubstring = currentLen }
            charIndexes[s[right], default:0] = right + 1
            right += 1
        }
        return longestSubstring
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.lengthOfLongestSubstring("abcabcbb"), 3)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.lengthOfLongestSubstring("pwwkew"), 3)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.lengthOfLongestSubstring("tmmzuxt"), 5)
    }
    
}

SolutionTests.defaultTestSuite.run()

