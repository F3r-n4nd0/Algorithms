import Foundation
import XCTest

/*
 Image Overlap
 
 Two images A and B are given, represented as binary, square matrices of the same size.  (A binary matrix has only 0s and 1s as values.)
 
 We translate one image however we choose (sliding it left, right, up, or down any number of units), and place it on top of the other image.  After, the overlap of this translation is the number of positions that have a 1 in both images.
 
 (Note also that a translation does not include any kind of rotation.)
 
 What is the largest possible overlap?
 */

class Solution {
    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        var onesA = [(Int, Int)](), onesB = [(Int, Int)]()
        for i in 0..<A.count {
            for j in 0..<A[i].count {
                if A[i][j] == 1 { onesA.append((i, j)) }
                if B[i][j] == 1 { onesB.append((i, j)) }
            }
        }
        var overlap = [Int: Int]()
        for row in onesA {
            for col in onesB {
                let dx = col.0 - row.0 + 35
                let dy = col.1 - row.1 + 35
                let sliding = dx * 70 + dy
                overlap[sliding, default: 0] += 1
            }
        }
        return overlap.values.max() ?? 0
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.largestOverlap([[1,1,0],
                                                [0,1,0],
                                                [0,1,0]], [[0,0,0],
                                                           [0,1,1],
                                                           [0,0,1]]), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

