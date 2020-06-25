import Foundation
import XCTest

/*
 Unique Binary Search Trees
 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?
 
 
 */

class Solution {
    func numTrees(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1 ... i {
                dp[i] += dp[j-1] * dp[i-j]
            }
        }
        return dp[n]
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.numTrees(1), 42)
        XCTAssertEqual(solution.numTrees(3), 5)
    }
    
}

SolutionTests.defaultTestSuite.run()

