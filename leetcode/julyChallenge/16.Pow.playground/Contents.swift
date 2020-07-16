import Foundation
import XCTest

/*
 Pow(x, n)
 
 Implement pow(x, n), which calculates x raised to the power n (xn).
 
 */

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else  { return 1 }
        let nextPow = myPow(x, n / 2)
        var result = nextPow * nextPow
        if n % 2 != 0 {
            result *= n < 0 ? 1/x : x
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.myPow(2.0, 10), 1024)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.myPow(2.0, -2), 0.25)
    }
    
}

SolutionTests.defaultTestSuite.run()
