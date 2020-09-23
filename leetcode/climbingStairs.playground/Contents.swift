import Foundation
import XCTest

/*
 Climbing Stairs
 
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n != 1 else { return 1 }
        guard n != 2 else { return 2 }
        var first = 1
        var second = 2
        for _ in 3..<n {
            let thirtd = first + second
            first = second
            second = thirtd
        }
        return first + second
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.climbStairs(2), 2)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.climbStairs(3), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

