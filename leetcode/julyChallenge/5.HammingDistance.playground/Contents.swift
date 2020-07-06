import Foundation
import XCTest

/*
 Hamming Distance
 
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, calculate the Hamming distance.

 Note:
 0 ≤ x, y < 2^31.

 */

class Solution {
 
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        return (x ^ y).nonzeroBitCount
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.hammingDistance(1, 4), 2)
        XCTAssertEqual(solution.hammingDistance(1, 5), 1)
    }
    
}

SolutionTests.defaultTestSuite.run()

