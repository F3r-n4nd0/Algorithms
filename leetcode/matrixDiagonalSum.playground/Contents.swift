import Foundation
import XCTest

/*
 Matrix Diagonal Sum
 
 Given a square matrix mat, return the sum of the matrix diagonals.

 Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.
 */

class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var result = 0
        for i in 0..<mat.count {
            result += mat[i][i]
            guard mat.count % 2 == 0 || i != mat.count>>1 else { continue }
            result += mat[i][mat.count-i-1]
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.diagonalSum([[1,2,3],
                                             [4,5,6],
                                             [7,8,9]]), 25)
    }
    
    
    func testExampleTwo() {
        XCTAssertEqual(solution.diagonalSum( [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]), 8)
    }
   
    
}

SolutionTests.defaultTestSuite.run()

