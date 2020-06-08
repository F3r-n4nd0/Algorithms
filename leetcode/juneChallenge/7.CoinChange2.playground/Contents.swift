import Foundation
import XCTest

/*
 Coin Change 2
 
 You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.
 */

class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0  { return 1 }
        var dp = Array(repeating: 0, count: amount+1)
        dp[0] = 1
        for coin in coins {
            if coin > amount { continue }
            for i in coin...amount {
                dp[i] += dp[i-coin]
            }
        }
        return dp[amount]
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.change(5, [1, 2, 5]), 4)
        XCTAssertEqual(solution.change(0, [7]), 1)
        XCTAssertEqual(solution.change(100, [1,101,102,103]), 1)
    }
    
}

SolutionTests.defaultTestSuite.run()

