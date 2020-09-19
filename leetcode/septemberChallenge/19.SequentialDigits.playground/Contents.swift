import Foundation
import XCTest

/*
 Sequential Digits
 
 An integer has sequential digits if and only if each digit in the number is one more than the previous digit.
 
 Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.
 */

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var result = [Int]()
        var diff = 0
        var sum = 0
        for i in 0..<9 {
            diff += Int(pow(10.0, Double(i)))
            sum += diff
            var tmp = sum
            for _ in 0..<9-i {
                if tmp >= low {
                    if tmp > high { return result }
                    result.append(tmp)
                }
                tmp += diff
            }
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.sequentialDigits(100, 300), [123,234])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.sequentialDigits(1000, 13000), [1234,2345,3456,4567,5678,6789,12345])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.sequentialDigits(58, 155), [67,78,89,123])
    }
    
}

SolutionTests.defaultTestSuite.run()

