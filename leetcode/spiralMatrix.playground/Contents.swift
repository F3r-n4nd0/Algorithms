import Foundation
import XCTest

/*
 Spiral Matrix
 
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        guard matrix.count > 0 else { return result }
        var minX = 0, minY = 0, maxX = matrix.count-1, maxY = matrix[0].count-1
        while minX <= maxX && minY <= maxY {
            for y in stride(from: minY, through: maxY, by: +1) {
                result.append(matrix[minX][y])
            }
            for x in stride(from: minX+1, through: maxX, by: +1) {
                result.append(matrix[x][maxY])
            }
            if minX < maxX && minY < maxY {
                for y in stride(from: maxY-1, to: minY, by: -1) {
                    result.append(matrix[maxX][y])
                }
                for x in stride(from: maxX, to: minX, by: -1) {
                    result.append(matrix[x][minY])
                }
            }
            minX += 1
            maxX -= 1
            minY += 1
            maxY -= 1
            
        }
        return result
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.spiralOrder([
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ]
        ]), [1,2,3,6,9,8,7,4,5])
    }
    
}

SolutionTests.defaultTestSuite.run()

