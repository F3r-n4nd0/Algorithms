import Foundation
import XCTest

/*
 Prison Cells After N Days
 
 There are 8 prison cells in a row, and each cell is either occupied or vacant.

 Each day, whether the cell is occupied or vacant changes according to the following rules:

 If a cell has two adjacent neighbors that are both occupied or both vacant, then the cell becomes occupied.
 Otherwise, it becomes vacant.
 (Note that because the prison is a row, the first and the last cells in the row can't have two adjacent neighbors.)

 We describe the current state of the prison in the following way: cells[i] == 1 if the i-th cell is occupied, else cells[i] == 0.

 Given the initial state of the prison, return the state of the prison after N days (and N such changes described above.)
 
 */

class Solution {
    
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        var N = N , cells = cells
        if N > 14 { N = N % 14 == 0 ? 14 : N % 14 }
        var newCells = Array(repeating: 0, count: 8)
        for _ in 0..<N {
            for i in 0..<8 {
                let left = (i-1) >= 0 ? cells[i-1] : 2
                let right = (i+1) < 8 ? cells[i+1] : 2
                if left == right {
                    newCells[i] = 1
                } else {
                    newCells[i] = 0
                }
            }
            cells = newCells
        }
        return cells
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.prisonAfterNDays([0,1,0,1,1,0,0,1], 7), [0,0,1,1,0,0,0,0])
    }
    
}

SolutionTests.defaultTestSuite.run()

