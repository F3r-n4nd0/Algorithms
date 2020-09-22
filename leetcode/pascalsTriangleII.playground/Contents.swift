import Foundation
import XCTest

/*
 Pascal's Triangle II
 
 Given an integer rowIndex, return the rowIndexth row of the Pascal's triangle.
 
 */

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        guard rowIndex > 1 else { return [1,1] }
        var prevRow = [1,1]
        for currentRowIndex in 2...rowIndex{
            var currentRow = [1]
            for prevRowIndex in 1..<currentRowIndex{
                currentRow.append(prevRow[prevRowIndex-1]+prevRow[prevRowIndex])
            }
            currentRow.append(1)
            prevRow = currentRow
        }
        return prevRow
    }
}

class Solution2 {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        var output = [Int]()
        for i in 0...rowIndex {
            output.append(1)
            for j in stride(from: i-1, through: 0, by: -1) where j >= 1 {
                output[j] = output[j-1] + output[j]
            }
        }
        return output
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.getRow(3), [1,3,3,1])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.getRow(4), [1,4,6,4,1])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.getRow(1), [1,1])
    }
    
}

SolutionTests.defaultTestSuite.run()

