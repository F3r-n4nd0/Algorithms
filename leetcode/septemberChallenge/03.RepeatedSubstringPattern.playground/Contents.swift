import Foundation
import XCTest

/*
 Repeated Substring Pattern
 
 Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
 */

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        guard s.count > 1 else { return false }
        let s = s.utf8CString
        var strPtr = 1
        while strPtr <= s.count>>1 {
            var testingPtr = strPtr
            var substrPtr = 0, isCriteriaMet = true
            var count = 1
            while testingPtr < s.count-1 {
                if s[substrPtr] != s[testingPtr] {
                    isCriteriaMet = false
                    break
                }
                substrPtr += 1
                testingPtr += 1
                if substrPtr == strPtr { substrPtr = 0; count += 1 }
            }
            if isCriteriaMet == true, count > 1, substrPtr == 0 { return true }
            strPtr += 1
        }
        
        return false
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.repeatedSubstringPattern("abcabcabcabcabcabc"), true)
    }
    
}

SolutionTests.defaultTestSuite.run()

