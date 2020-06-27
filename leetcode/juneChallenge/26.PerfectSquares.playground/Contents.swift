import Foundation
import XCTest

/*
 Perfect Squares
 
 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.

 */

class Solution {
    
    func numSquares(_ n: Int) -> Int {
        var n = n
        while n % 4 == 0 {
            n = n / 4
        }
        if n % 8 == 7 { return 4 }
        var m = 0
        while m * m <= n {
            let l = Int(sqrt(Double(n - m * m)))
            if (l * l + m * m) == n {
                return (l > 0 && m > 0) ? 2 : 1
            }
            m = m + 1
        }
        return 3
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.numSquares(12), 3)
        XCTAssertEqual(solution.numSquares(13), 2)
    }
    
}

SolutionTests.defaultTestSuite.run()

