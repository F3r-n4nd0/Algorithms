import Foundation
import XCTest

/*
 Surrounded Regions
 
 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
 
 A region is captured by flipping all 'O's into 'X's in that surrounded region.
 
 */


class Solution {
    func solve(_ board: inout [[Character]]) {
        let dirs = [(1,0),(0,1),(-1,0),(0,-1)]
        var tilesFound = [(Bool,[(Int,Int)])]()
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "X" ||  board[i][j] == "Y" { continue }
                var touchBorder = false
                let tilesO = searchConnections(&board, i, j, dirs, &touchBorder)
                tilesFound.append((touchBorder, tilesO))
            }
        }
        for (touchBorder, tiles) in tilesFound {
            for (tileI, tileJ) in tiles {
                board[tileI][tileJ] = touchBorder ? "O" : "X"
            }
        }
    }
    
    func searchConnections(_ board: inout [[Character]],_ i: Int,_ j: Int,_ dirs: [(Int,Int)],_ touchBorder: inout Bool) -> [(Int,Int)] {
        if i < 0 || j < 0 || i >= board.count || j >= board[i].count || board[i][j] != "O" {
            return []
        }
        if i == 0 || j == 0 || i == board.count-1 || j == board[i].count-1 {
            touchBorder = true
        }
        var result = [(i,j)]
        board[i][j] = "Y"
        for dir in dirs {
            let nextI = i + dir.0
            let nextJ = j + dir.1
            result += searchConnections(&board, nextI, nextJ, dirs, &touchBorder)
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        var board: [[Character]] = [["X", "X", "X", "X"],
                                    ["X", "O", "O", "X"],
                                    ["X", "X", "O", "X"],
                                    ["X", "O", "X", "X"]]
        solution.solve(&board)
        XCTAssertEqual(board,
                       [["X", "X", "X", "X"],
                        ["X", "X", "X", "X"],
                        ["X", "X", "X", "X"],
                        ["X", "O", "X", "X"]])
    }
    
}

SolutionTests.defaultTestSuite.run()

