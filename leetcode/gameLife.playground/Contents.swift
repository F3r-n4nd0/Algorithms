import Foundation
import XCTest

/*
 Game of Life
 
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
 
 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
 
 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.
 */

class Solution {
    
    func gameOfLife(_ board: inout [[Int]]) {
        var newBoard = board
        for x in 0..<board.count {
            for y in 0..<board[x].count {
                let count = liveNeighbors(x, y, board)
                if board[x][y] == 1 && (count < 2 || count > 3) {
                    newBoard[x][y] = 0
                } else if board[x][y] == 0 && count == 3{
                    newBoard[x][y] = 1
                }
            }
        }
        board = newBoard
    }
    
    func liveNeighbors(_ x: Int,_ y: Int,_ board: [[Int]]) -> Int {
        var result = 0
        let moves = [(-1,-1), (0,-1), (1,-1),
                     (-1,0), (1,0),
                     (-1,1), (0,1), (1,1)]
        for move in moves {
            let newX = x + move.0
            let newY = y + move.1
            guard newX>=0 && newY>=0 && newX<board.count && newY<board[newX].count else { continue }
            if board[newX][newY] == 1 {
                result += 1
            }
        }
        return result
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        var board = [
            [0,1,0],
            [0,0,1],
            [1,1,1],
            [0,0,0]
        ]
        solution.gameOfLife(&board)
        XCTAssertEqual(board, [
            [0,0,0],
            [1,0,1],
            [0,1,1],
            [0,1,0]
        ])
    }
    
}

SolutionTests.defaultTestSuite.run()

