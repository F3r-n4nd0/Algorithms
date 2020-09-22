import Foundation
import XCTest

/*
 Pascal's Triangle
 
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }
        var output = [[1]]
        for _ in 1..<numRows {
            var row = [Int]()
            let prevRow = output.last ?? []
            row.append(1)
            for j in stride(from: 0, to: prevRow.count-1, by: +1) {
                row.append(prevRow[j] + prevRow[j+1])
            }
            row.append(1)
            output.append(row)
            
        }
       return output
    }
}

class Solution2 {
    
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }
        guard numRows > 1 else { return [[1]] }
        return [[1]] + createRow([1], numRows-1)
    }
    
    private func createRow(_ triangle: [Int],_ level: Int) -> [[Int]] {
        var row = [Int]()
        row.append(1)
        for i in 0..<triangle.count-1 {
            row.append(triangle[i] + triangle[i+1])
        }
        row.append(1)
        if level-1 == 0 {
            return [row]
        }
        return [row] + createRow(row, level-1)
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.generate(5),
                       [
            [1],
           [1,1],
          [1,2,1],
         [1,3,3,1],
        [1,4,6,4,1]
       ])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.generate(1),
                       [
            [1]
       ])
    }
    
}

SolutionTests.defaultTestSuite.run()

