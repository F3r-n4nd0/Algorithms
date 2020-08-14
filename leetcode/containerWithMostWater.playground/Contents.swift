import Foundation
import XCTest

/*
 Container With Most Water
 
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

 Note: You may not slant the container and n is at least 2.
 
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else { return height.first ?? 0 }
        var result = 0
        var left = 0, right = height.count-1
        while left < right  {
            let area = calculateArea(left, right, min(height[left], height[right]))
            if area > result { result = area }
            if height[left] <  height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return result
    }
    private func calculateArea(_ i1: Int,_ i2: Int,_ height: Int) -> Int {
        let width = abs(i1-i2)
        return height * width
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxArea([1,8,6,2,5,4,8,3,7]), 49)
    }
    
}

SolutionTests.defaultTestSuite.run()

