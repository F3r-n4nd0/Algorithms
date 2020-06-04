import Foundation
import XCTest

/*
 Reverse String
 
 Write a function that reverses a string. The input string is given as an array of characters char[].

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 You may assume all the characters consist of printable ascii characters.
 */

class Solution {
    func reverseString(_ s: inout [Character]) {
        var first = 0, last = s.count-1
        while first < last {
            (s[first], s[last]) = (s[last], s[first])
            first += 1
            last -= 1
        }
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        var word :[Character] = ["h","e","l","l","o"]
        solution.reverseString(&word)
        XCTAssertEqual(word, ["o","l","l","e","h"])
    }
    
}

SolutionTests.defaultTestSuite.run()

