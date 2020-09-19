import Foundation
import XCTest

/*
 Best Time to Buy and Sell Stock
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Note that you cannot sell a stock before you buy one.
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var max = 0
        for i in 0..<prices.count-1 {
            for j in i+1..<prices.count {
                let m = prices[j] - prices[i]
                if max < m {
                    max = m
                }
            }
        }
        return max
    }
}

class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var best = 0, current = 0
        for index in 1..<prices.count {
            current = max(0, current + prices[index] - prices[index-1])
            best = max(best, current)
        }
        return best
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxProfit([7,1,5,3,6,4]), 5)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.maxProfit([7,6,4,3,1]), 0)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.maxProfit([2,4,1]), 2)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.maxProfit([4,1,2]), 1)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.maxProfit([7,1,5,3,6,4]), 5)
    }
    
}

SolutionTests.defaultTestSuite.run()

