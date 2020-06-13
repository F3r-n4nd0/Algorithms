import Foundation
import XCTest

/*
 Final Prices With a Special Discount in a Shop
 
 Given the array prices where prices[i] is the price of the ith item in a shop. There is a special discount for items in the shop, if you buy the ith item, then you will receive a discount equivalent to prices[j] where j is the minimum index such that j > i and prices[j] <= prices[i], otherwise, you will not receive any discount at all.

 Return an array where the ith element is the final price you will pay for the ith item of the shop considering the special discount.
 */

class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var result = prices
        for i in 0..<prices.count-1 {
            for j in i+1..<prices.count {
                if prices[j] <= prices[i] {
                    result[i] = prices[i] - prices[j]
                    break
                }
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
        XCTAssertEqual(solution.finalPrices([8,4,6,2,3]), [4,2,4,2,3])
        XCTAssertEqual(solution.finalPrices([1,2,3,4,5]), [1,2,3,4,5])
    }
    
}

SolutionTests.defaultTestSuite.run()

