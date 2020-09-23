import Foundation
import XCTest

/*
 Rotate Image
 
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
 
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 */

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else { return }
        flipDiagonally(&matrix)
        flipHorizontally(&matrix)
    }
    
    private func flipDiagonally(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            for j in 0..<n-i {
                print("\(i)  \(j)")
                let val = matrix[i][j]
                matrix[i][j] = matrix[n-j-1][n-i-1]
                matrix[n-j-1][n-i-1] = val
            }
        }
    }
    
    private func flipHorizontally(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n/2 {
            for j in 0..<n {
                let val = matrix[i][j]
                matrix[i][j] = matrix[n-i-1][j]
                matrix[n-i-1][j] = val
            }
        }
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        var matrix = [[1,2,3],[4,5,6],[7,8,9]]
        solution.rotate(&matrix)
        XCTAssertEqual(matrix, [[7,4,1],[8,5,2],[9,6,3]])
    }
    
}

SolutionTests.defaultTestSuite.run()

