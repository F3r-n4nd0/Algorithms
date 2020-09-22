import Foundation
import XCTest

/*
 Valid Parentheses
 
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count > 0 else { return true }
        let parenthesesPattern: [Character:Character] = [")":"(","}":"{","]":"["]
        var openParentheses = [Character]()
        for char in s {
            if let openChar = parenthesesPattern[char] {
                guard let lastChar = openParentheses.popLast(), lastChar == openChar else { return false }
            } else {
                openParentheses.append(char)
            }
        }
        return openParentheses.isEmpty
     }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.isValid("()"), true)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.isValid("()[]{}"), true)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.isValid("([)]"), false)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.isValid(")([]"), false)
    }
    
}

SolutionTests.defaultTestSuite.run()

