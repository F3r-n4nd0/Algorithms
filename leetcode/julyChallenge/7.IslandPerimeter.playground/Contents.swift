import Foundation
import XCTest

/*
 Island Perimeter
 
 You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.
 
 Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
 
 The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 */

class Solution {
    
    struct Pair<T: Hashable>: Hashable {
        
        let left: T
        let right: T
        
        init(_ left: T, _ right: T) {
            self.left = left
            self.right = right
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(left)
            hasher.combine(right)
        }
        
        static func ==(lhs: Pair<T>, rhs: Pair<T>) -> Bool {
            return lhs.left == rhs.left && lhs.right == rhs.right
        }
        
    }
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let movements = [(1,0),(0,1),(-1,0),(0,-1)]
        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                if grid[x][y] == 1 {
                    var set = Set<Pair<Int>>()
                    return islandPerimeter(grid, x, y, movements, &set)
                }
            }
        }
        return 0
    }
    
    private func islandPerimeter(_ grid: [[Int]],_ x: Int,_ y: Int,_ movements: [(Int,Int)],_ selected: inout Set<Pair<Int>>) -> Int {
        selected.insert(Pair(x, y))
        var perimeter = 0
        for movement in movements {
            let newX = x + movement.0
            let newY = y + movement.1
            if newX >= 0 && newX < grid.count &&
                newY >= 0 && newY < grid[x].count &&
                grid[newX][newY] == 1 && !selected.contains(Pair(newX, newY)) {
                perimeter += islandPerimeter(grid, newX, newY, movements, &selected)
            } else {
                perimeter += selected.contains(Pair(newX, newY)) ? 0 : 1
            }
        }
        return perimeter
    }
    
}

class Solution2 {
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var grid = grid
        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                if grid[x][y] == 1 {
                    return islandPerimeter(&grid, x, y)
                }
            }
        }
        return 0
    }
    
    private func islandPerimeter(_ grid: inout [[Int]],_ x: Int,_ y: Int) -> Int {
        var perimeter = 0
        grid[x][y] = 3
        if x == 0 { perimeter += 1 }
        else if grid[x - 1][y] == 0 { perimeter += 1 }
        else if grid[x - 1][y] == 1 {
            perimeter += islandPerimeter(&grid, x-1, y)
        }
        
        if x == grid.count - 1 { perimeter += 1 }
        else if grid[x + 1][y] == 0 { perimeter += 1 }
        else if grid[x + 1][y] == 1 {
            perimeter += islandPerimeter(&grid, x+1, y)
        }
        
        if y == 0 { perimeter += 1 }
        else if grid[x][y - 1] == 0 { perimeter += 1 }
        else if grid[x][y - 1] == 1 {
            perimeter += islandPerimeter(&grid, x, y-1)
        }
        
        if y == grid[x].count - 1 { perimeter += 1 }
        else if grid[x][y + 1] == 0 { perimeter += 1 }
        else if grid[x][y + 1] == 1 {
            perimeter += islandPerimeter(&grid, x, y+1)
        }
        return perimeter
    }
    
}

class Solution3 {
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        for x in 0..<grid.count {
            for y in 0..<grid[x].count where grid[x][y] == 1 {
                if x == 0 { perimeter += 1 }
                else if grid[x - 1][y] == 0 { perimeter += 1 }
                
                if x == grid.count - 1 { perimeter += 1 }
                else if grid[x + 1][y] == 0 { perimeter += 1 }
                
                if y == 0 { perimeter += 1 }
                else if grid[x][y - 1] == 0 { perimeter += 1 }
                
                if y == grid[x].count - 1 { perimeter += 1 }
                else if grid[x][y + 1] == 0 { perimeter += 1 }
            }
        }
        return perimeter
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.islandPerimeter([[0,1,0,0],
                                                 [1,1,1,0],
                                                 [0,1,0,0],
                                                 [1,1,0,0]]), 16)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.islandPerimeter([[1,1],[1,1]]), 8)
    }
    
}

SolutionTests.defaultTestSuite.run()

