import Foundation
import XCTest

/*
 Shortest Bridge
 
 In a given 2D binary array A, there are two islands.  (An island is a 4-directionally connected group of 1s not connected to any other 1s.)
 
 Now, we may change 0s to 1s so as to connect the two islands together to form 1 island.
 
 Return the smallest number of 0s that must be flipped.  (It is guaranteed that the answer is at least 1.)
 
 */

class Solution {
    
    func shortestBridge(_ A: [[Int]]) -> Int {
        let m = A.count, n = A[0].count
        let dirs = [(1,0),(0,1),(-1,0),(0,-1)]
        var q = [(Int,Int)] ()
        var A = A
        var found = false
        for i in 0..<m {
            if (found) { break }
            for j in 0..<n {
                if (A[i][j] == 0) { continue }
                q = getIsland(&A, i, j, m-1, n-1, dirs)
                found = true
                break
            }
        }
        var step = 0;
        while !q.isEmpty {
            var size = q.count
            while size > 0 {
                size -= 1
                let cur = q.removeFirst()
                for dir in dirs {
                    let i = cur.0 + dir.0
                    let j = cur.1 + dir.1
                    if (i >= 0 && j >= 0 && i < m && j < n && A[i][j] != 3) {
                        if (A[i][j] == 1) {
                            return step
                        }
                        q.append((i, j))
                        A[i][j] = 3
                    }
                }
            }
            step += 1
        }
        return -1;
    }
    
    func getIsland(_ board: inout [[Int]], _ x: Int, _ y: Int,_ height: Int,_ width: Int,_ dirs: [(Int,Int)]) -> [(Int,Int)] {
        var result = [(Int,Int)] ()
        board[x][y] = 3
        var countMediterranean = 0
        for dir in dirs {
            let nextX = x + dir.0
            let nextY = y + dir.1
            if nextX<0 || nextY<0 || nextX>height || nextY>width || board[nextX][nextY] == 3 {
                countMediterranean += 1
                continue
            }
            if board[nextX][nextY] == 1 {
                countMediterranean += 1
                result.append(contentsOf: getIsland(&board, nextX, nextY, height, width, dirs))
            }
        }
        if countMediterranean < 4 {
            result.insert((x,y), at: 0)
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
        XCTAssertEqual(solution.shortestBridge( [[1,1,0,0,0],
                                                 [1,0,0,0,0],
                                                 [1,0,0,0,0],
                                                 [0,0,0,1,1],
                                                 [0,0,0,1,1]]),3)
        XCTAssertEqual(solution.shortestBridge([[0,0,1,0,1],
                                                [0,1,1,0,1],
                                                [0,1,0,0,1],
                                                [0,0,0,0,0],
                                                [0,0,0,0,0]]),1)
        XCTAssertEqual(solution.shortestBridge([[0,1],[1,0]]), 1)
        XCTAssertEqual(solution.shortestBridge([[0,1,0],[0,0,0],[0,0,1]]), 2)
        XCTAssertEqual(solution.shortestBridge([[1,1,1,1,1],
                                                [1,0,0,0,1],
                                                [1,0,1,0,1],
                                                [1,0,0,0,1],
                                                [1,1,1,1,1]]), 1)
    }
    
}

SolutionTests.defaultTestSuite.run()

//class Solution {
//
//    func shortestBridge(_ A: [[Int]]) -> Int {
//        var board = A
//        let height = A.count-1, width = A[0].count-1
//        var islandsA = [(Int,Int)]()
//        var islandsB = [(Int,Int)]()
//        for x in 0..<board.count {
//            for y in 0..<board[x].count {
//                if board[x][y] == 0 || board[x][y] == 3 { continue }
//                if islandsA.isEmpty {
//                    islandsA = getIsland(&board, x, y, height, width)
//                } else {
//                    islandsB = getIsland(&board, x, y, height, width)
//                    break
//                }
//            }
//        }
//        var minDistance = Int.max
//        for islandA in islandsA {
//            for islandB in islandsB {
//                let distance = (abs(islandA.0 - islandB.0) + abs(islandA.1 - islandB.1)) - 1
//                minDistance = min(minDistance, distance)
//            }
//        }
//        return minDistance
//    }
//
//    func getIsland(_ board: inout [[Int]], _ x: Int, _ y: Int,_ height: Int,_ width: Int) -> [(Int,Int)] {
//        var result = [(Int,Int)] ()
//        board[x][y] = 3
//        var countMediterranean = 0
//        if x>0 {
//            if board[x-1][y] == 3 {
//                countMediterranean += 1
//            }
//            if board[x-1][y] == 1 {
//                countMediterranean += 1
//                result.append(contentsOf: getIsland(&board, x-1, y, height, width))
//            }
//        } else {
//            countMediterranean += 1
//        }
//        if y>0 {
//            if board[x][y-1] == 3 {
//                countMediterranean += 1
//            }
//            if board[x][y-1] == 1 {
//                countMediterranean += 1
//                result.append(contentsOf: getIsland(&board, x, y-1, height, width))
//            }
//        } else {
//            countMediterranean += 1
//        }
//        if x<height {
//            if board[x+1][y] == 3 {
//                countMediterranean += 1
//            }
//            if  board[x+1][y] == 1 {
//                countMediterranean += 1
//                result.append(contentsOf: getIsland(&board, x+1, y, height, width))
//            }
//        } else {
//            countMediterranean += 1
//        }
//        if y<width {
//            if board[x][y+1] == 3 {
//                countMediterranean += 1
//            }
//            if board[x][y+1] == 1 {
//                countMediterranean += 1
//                result.append(contentsOf: getIsland(&board, x, y+1, height, width))
//            }
//        } else {
//            countMediterranean += 1
//        }
//        if countMediterranean < 4 {
//            result.insert((x,y), at: 0)
//        }
//        return result
//    }
//
//}
