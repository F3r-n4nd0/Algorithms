import Foundation
import XCTest

/*
 Number of Islands
 
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 
 */

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        var grid = grid
        var output = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    output += 1
                    removeIsland(&grid, i, j)
                }
            }
        }
        return output
    }
    
    private func removeIsland(_ grid: inout [[Character]],_ i: Int,_ j: Int) {
        guard i >= 0, j >= 0, i < grid.count, j < grid[i].count, grid[i][j] == "1" else { return }
        grid[i][j] = "0"
        removeIsland(&grid, i, j+1)
        removeIsland(&grid, i+1, j)
        removeIsland(&grid, i, j-1)
        removeIsland(&grid, i-1, j)
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.numIslands([
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
        ]), 1)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.numIslands([
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
        ]), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

