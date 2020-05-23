import UIKit
import XCTest

/*
Say you have an array for which the ith element is the price of a given stock on day i.

If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

Note that you cannot sell a stock before you buy one.
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        var min = prices[0]
        var diff = 0
        for i in 1..<prices.count {
            let price = prices[i]
            if price < min {
                min = price
            } else if ((price - min) > diff) {
                diff = price - min
            }
        }
        return diff
    }
}


class SolutionTests: XCTestCase {
    
    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
    }

    func testExampleOne() {
        XCTAssertEqual(solution.maxProfit([7,1,5,3,6,4]), 5)
        XCTAssertEqual(solution.maxProfit([7,6,4,3,1]), 0)
        XCTAssertEqual(solution.maxProfit([]), 0)
        XCTAssertEqual(solution.maxProfit([2,4,1]), 2)
        XCTAssertEqual(solution.maxProfit([2,1,4]),3)
    }

}

SolutionTests.defaultTestSuite.run()

