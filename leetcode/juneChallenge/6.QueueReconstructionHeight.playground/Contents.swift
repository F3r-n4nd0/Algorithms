import Foundation
import XCTest

/*
 Queue Reconstruction by Height
 
 Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.
 
 Note:
 The number of people is less than 1,100.
 
 */

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let sortByHeigth = people.sorted{
            if $0[0] == $1[0] { return $0[1] < $1[1] }
            else { return $0[0] > $1[0] }
        }
        return sortByHeigth.reduce(into: [[Int]]()) {
            $0.insert($1, at: $1[1])
        }
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.reconstructQueue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]), [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]])
        XCTAssertEqual(solution.reconstructQueue([[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]), [[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]])
    }
    
}

SolutionTests.defaultTestSuite.run()

