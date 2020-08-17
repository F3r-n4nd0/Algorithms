import Foundation
import XCTest

/*
 Magnetic Force Between Two Balls
 
 In universe Earth C-137, Rick discovered a special form of magnetic force between two balls if they are put in his new invented basket. Rick has n empty baskets, the ith basket is at position[i], Morty has m balls and needs to distribute the balls into the baskets such that the minimum magnetic force between any two balls is maximum.

 Rick stated that magnetic force between two different balls at positions x and y is |x - y|.

 Given the integer array position and the integer m. Return the required force.
 */

class Solution {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        let sortPosition = position.sorted()
        var left = 0, right = sortPosition[sortPosition.count-1] - position[0]
        while left < right {
            let mid = (left+right)>>1
            if count(sortPosition, mid) >= m {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }
    private func count(_ position: [Int],_ d: Int) -> Int {
        let n = position.count
        var ans = 1, curr = position[0]
        for i in 1..<n {
            if position[i] - curr >= d {
                ans += 1
                curr = position[i]
            }
        }
        return ans
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxDistance([1,2,3,4,7], 3), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

