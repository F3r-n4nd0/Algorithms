import Foundation
import XCTest

/*
 Unique Paths
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 How many possible unique paths are there?
 
 */

class Solution {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else {
            return 0
        }
        if m > n {
            return uniquePaths(n, m)
        }
        var arr = Array(repeating: 1, count: m)
        for _ in 1..<n {
            for i in 1..<m {
                arr[i] = arr[i-1] + arr[i]
            }
        }
        return arr[m-1]
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.uniquePaths(4, 3), 10)
//        XCTAssertEqual(solution.uniquePaths(3, 2), 3)
//        XCTAssertEqual(solution.uniquePaths(7, 3), 28)
//        XCTAssertEqual(solution.uniquePaths(23, 12), 193536720)
    }
    
}

SolutionTests.defaultTestSuite.run()

