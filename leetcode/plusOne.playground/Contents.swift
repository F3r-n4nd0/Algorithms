import Foundation
import XCTest

/*
 Plus One
 
 Given a non-empty array of digits representing a non-negative integer, increment one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in stride(from: digits.count-1, through: 0, by: -1) {
            if digits[i] < 9 {
                digits[i] += 1
                return digits
            }
            digits[i] = 0
        }
        return [1] + digits
    }
}

class Solution2 {
    
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

class Solution3 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var output = digits
        var i = output.count - 1
        while i >= 0 && output[i] == 9 {
            output[i] = 0
            i -= 1
        }
        if i >= 0 {
            output[i] += 1
            return output
        }
        return [1] + digits
    }
}
 
class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.plusOne([1,2,3]), [1,2,4])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.plusOne([1,2,9]), [1,3,0])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.plusOne([9,9,9]), [1,0,0,0])
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.plusOne([8,9,9,9]), [9,0,0,0])
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.plusOne([9]), [1,0])
    }
    
}

SolutionTests.defaultTestSuite.run()

