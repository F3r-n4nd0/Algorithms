import Foundation
import XCTest

/*
 Reverse Words in a String
 
 Given an input string, reverse the string word by word.
 */

class Solution {
    func reverseWords(_ s: String) -> String {
        let s = Array(s)
        var result = [Character]()
        var index = 0
        for i in 0..<s.count {
            let currentChar = s[i]
            if currentChar != " " {
                result.insert(currentChar, at: index)
                index += 1
            } else if index != 0 {
                result.insert(currentChar, at: 0)
                index = 0
            }
        }
        if let firstChar = result.first, firstChar == " " { result.removeFirst() }
        return result.reduce(""){ $0 + String($1)}
    }
}

class Solution2 {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").filter{$0 != " "}.reversed().joined(separator: " ")
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.reverseWords("the sky is blue"), "blue is sky the")
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.reverseWords("  hello world!  "), "world! hello")
    }
    
}

SolutionTests.defaultTestSuite.run()
