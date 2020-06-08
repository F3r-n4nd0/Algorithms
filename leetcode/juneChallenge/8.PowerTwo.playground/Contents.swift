import Foundation
import XCTest

/*
 Power of Two
 
 Given an integer, write a function to determine if it is a power of two.
 */

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 { return false }
        return (n & (n - 1)) == 0
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.isPowerOfTwo(16), true)
        XCTAssertEqual(solution.isPowerOfTwo(1), true)
        XCTAssertEqual(solution.isPowerOfTwo(218), false)
    }
    
}

SolutionTests.defaultTestSuite.run()

