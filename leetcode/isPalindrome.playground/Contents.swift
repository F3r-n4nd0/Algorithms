import Foundation
import XCTest

/*
 Is Palindrome
 
 */

class Solution {
    func isPalindrome(_ num: Int) -> Bool {
        guard num > 0, num%10 != 0 else { return false }
        var num = num, numMirrow = 0
        while num > numMirrow {
            let lastDigit = num % 10
            numMirrow = numMirrow * 10 + lastDigit
            num /= 10
        }
        return num == numMirrow || num == numMirrow/10
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.isPalindrome(121), true)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.isPalindrome(-121), false)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.isPalindrome(10), false)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.isPalindrome(123494321), true)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.isPalindrome(245542), true)
    }
    
}

SolutionTests.defaultTestSuite.run()

