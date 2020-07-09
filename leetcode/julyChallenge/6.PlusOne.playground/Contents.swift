import Foundation
import XCTest

/*
 Plus One
 
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.
 */

class Solution {
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        plusOne(&result, digits.count-1)
        return result
    }
    
    private func plusOne(_ digits: inout [Int],_ position: Int) {
        guard digits.count > 0 && position >= 0 else {
            digits.insert(1, at: 0)
            return
        }
        if digits[position] >= 9 {
            digits[position] = 0
            return plusOne(&digits, position-1)
        }
        digits[position] += 1
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.plusOne([1,2,3]), [1,2,4])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.plusOne([4,3,2,1]), [4,3,2,2])
    }
    
    func testExampleThee() {
        XCTAssertEqual(solution.plusOne([9]), [1,0])
    }
    
}

SolutionTests.defaultTestSuite.run()

