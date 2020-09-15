import Foundation
import XCTest

/*
 Length of Last Word
 
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.

 If the last word does not exist, return 0.

 Note: A word is defined as a maximal substring consisting of non-space characters only.
 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let s = Array(s)
        var i = s.count-1, count = 0
        while i >= 0 {
            if s[i] == " " {
                if count > 0 { return count }
            } else {
                count += 1
            }
            i -= 1
        }
        return count
    }
}

class Solution2 {
    func lengthOfLastWord(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let parts = s.split(separator: " ")
        return parts.last?.count ?? 0
    }
}

class Solution3 {
    func lengthOfLastWord(_ s: String) -> Int {
        let x = s.split(separator: " ")
        return x.isEmpty ? 0 : x.last!.count
    }
}


class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.lengthOfLastWord("Hello World"), 5)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.lengthOfLastWord("a"), 1)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.lengthOfLastWord("a "), 1)
    }
    
}

SolutionTests.defaultTestSuite.run()

