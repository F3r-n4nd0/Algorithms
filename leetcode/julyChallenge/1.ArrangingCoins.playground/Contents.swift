import Foundation
import XCTest

/*
 Arranging Coins
 
 You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

 Given n, find the total number of full staircase rows that can be formed.

 n is a non-negative integer and fits within the range of a 32-bit signed integer.
 
 */

class Solution {
    
    func arrangeCoins(_ n: Int) -> Int {
        guard n > 1 else { return n }
        let result = sqrt(Double(1 + (8 * n))) - 1
        return Int(result / 2)
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.arrangeCoins(5), 2)
        XCTAssertEqual(solution.arrangeCoins(8), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

