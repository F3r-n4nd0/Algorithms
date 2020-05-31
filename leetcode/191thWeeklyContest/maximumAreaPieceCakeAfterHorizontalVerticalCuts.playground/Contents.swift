import Foundation
import XCTest

/*
 Maximum Area of a Piece of Cake After Horizontal and Vertical Cuts
 
 Given a rectangular cake with height h and width w, and two arrays of integers horizontalCuts and verticalCuts where horizontalCuts[i] is the distance from the top of the rectangular cake to the ith horizontal cut and similarly, verticalCuts[j] is the distance from the left of the rectangular cake to the jth vertical cut.

 Return the maximum area of a piece of cake after you cut at each horizontal and vertical position provided in the arrays horizontalCuts and verticalCuts. Since the answer can be a huge number, return this modulo 10^9 + 7.
 */

class Solution {
    
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        
        var horizontalCuts = horizontalCuts.sorted()
        var verticalCuts = verticalCuts.sorted()
        
        if horizontalCuts.last != h { horizontalCuts.append(h) }
        if verticalCuts.last != w { verticalCuts.append(w) }

        let maxH = horizontalCuts.reduce(into: (0,0)) {
            let dist = $1 - $0.1
            if dist > $0.0 {$0.0 = dist}
            $0.1 = $1
        }.0
        
        let maxV = verticalCuts.reduce(into: (0,0)) {
            let dist = $1 - $0.1
            if dist > $0.0 {$0.0 = dist}
            $0.1 = $1
        }.0
        
        return (maxH * maxV) % (1000000007)
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxArea(5, 4, [1,2,4], [1,3]), 4)
        XCTAssertEqual(solution.maxArea(5, 4, [3,1], [1]), 6)
        XCTAssertEqual(solution.maxArea(5, 4, [3], [3]), 9)
        XCTAssertEqual(solution.maxArea(7, 7, [1,2,4,5], [1,3,4]), 6)
    }
    
}

SolutionTests.defaultTestSuite.run()


