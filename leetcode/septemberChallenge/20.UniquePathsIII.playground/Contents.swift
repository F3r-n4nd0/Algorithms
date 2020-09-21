import Foundation
import XCTest

/*
 Unique Paths III
 
 On a 2-dimensional grid, there are 4 types of squares:
 
 1 represents the starting square.  There is exactly one starting square.
 2 represents the ending square.  There is exactly one ending square.
 0 represents empty squares we can walk over.
 -1 represents obstacles that we cannot walk over.
 Return the number of 4-directional walks from the starting square to the ending square, that walk over every non-obstacle square exactly once.
 
 */

class Solution {
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var count = 0, x = 0, y = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 0 { count += 1 }
                if grid[i][j] == 1 {
                    x = i
                    y = j
                }
            }
        }
        return findPath(grid, x, y, [], count)
    }
    
    private func findPath(_ grid: [[Int]],_ x: Int,_ y: Int,_ checked: [(Int,Int)],_ max: Int) -> Int {
        guard x >= 0, y >= 0, x < grid.count, y < grid[x].count else { return 0 }
        if grid[x][y] == 2 {
            return max+1 == checked.count ? 1 : 0
        }
        if grid[x][y] == -1 { return 0 }
        if checked.contains(where: { $0.0 == x && $0.1 == y }) { return 0 }
        return
            findPath(grid, x+1, y, checked+[(x,y)], max) +
            findPath(grid, x, y+1, checked+[(x,y)], max) +
            findPath(grid, x-1, y, checked+[(x,y)], max) +
            findPath(grid, x, y-1, checked+[(x,y)], max)
    }
    
}

class Solution2 {
    
    var visitMap = [[Int]]()
    
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        visitMap = grid
        var openCount = 0
        var start: (Int,Int)?
        for j in 0..<grid.count {
            for i in 0..<grid[0].count {
                let content = grid[j][i]
                if content == 0 || content == 2 { openCount += 1 }
                if content == 1 { start = (i,j) }
            }
        }
        guard let startPosition = start else { return 0 }
        return move(startPosition.0, startPosition.1, openCount)
    }
    
    func move(_ x: Int, _ y: Int, _ openCount: Int) -> Int {
        guard x >= 0, y >= 0, y < visitMap.count, x < visitMap[0].count else { return 0 }
        if visitMap[y][x] == -1 || visitMap[y][x] == 3 { return 0 }
        if visitMap[y][x] == 2 { return openCount == 0 ? 1 : 0 }
        let temp = visitMap[y][x]
        visitMap[y][x] = 3
        var partialResult = 0
        partialResult += move(x, y-1, openCount-1)
        partialResult += move(x, y+1, openCount-1)
        partialResult += move(x-1, y, openCount-1)
        partialResult += move(x+1, y, openCount-1)
        visitMap[y][x] = temp
        return partialResult
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.uniquePathsIII([[1,0,0,0],
                                                [0,0,0,0],
                                                [0,0,2,-1]]), 2)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.uniquePathsIII([[1,0,0,0],
                                                [0,0,0,0],
                                                [0,0,0,2]]), 4)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.uniquePathsIII([[0,1],
                                                [2,0]]), 0)
    }
    
}

SolutionTests.defaultTestSuite.run()

