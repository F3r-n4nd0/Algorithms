import Foundation
import XCTest

/*
 Best Time to Buy and Sell Stock II

 Say you have an array prices for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

 */

class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        var result = 0
        for i in 1..<prices.count {
            if prices[i-1] < prices[i] {
                result += prices[i] - prices[i-1]
            }
        }
        return result
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxProfit([7,1,5,3,6,4]), 7)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.maxProfit([1,2,3,4,5]), 4)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.maxProfit([7,6,4,3,1]), 0)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.maxProfit([]), 0)
    }
    
}

SolutionTests.defaultTestSuite.run()

