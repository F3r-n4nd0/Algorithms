import Foundation
import XCTest

/*
 Insert Interval
 
 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

 You may assume that the intervals were initially sorted according to their start times.
 */

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return [newInterval] }
        guard newInterval.count > 0 else { return intervals }
        let merge = (intervals + [newInterval]).sorted { (i, j) -> Bool in
            i[0] < j[0]
        }
        var res = [merge[0]]
        for i in 1..<merge.count {
            if res[res.count-1][1] >= merge[i][0] {
                res[res.count-1][1] = max(res[res.count-1][1], merge[i][1])
            } else {
                res.append(merge[i])
            }
        }
        return res
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.insert([[1,3],[6,9]], [2,5]), [[1,5],[6,9]])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]), [[1,2],[3,10],[12,16]])
    }
    
    func testExampleThee() {
        XCTAssertEqual(solution.insert([], [5,7]), [[5,7]])
    }

    func testExampleFour() {
        XCTAssertEqual(solution.insert([[1,5]], [2,3]), [[1,5]])
    }

    func testExampleFive() {
        XCTAssertEqual(solution.insert([[1,5]], [0,3]), [[0,5]])
    }
    
    func testExampleSix() {
        XCTAssertEqual(solution.insert([[1,5]], [0,0]), [[0,0],[1,5]])
    }
    
    func testExampleSeven() {
        XCTAssertEqual(solution.insert([[1,5]], [6,8]), [[1,5],[6,8]])
    }
    
    func testExampleEight() {
        XCTAssertEqual(solution.insert([[1,5]], [0,6]), [[0,6]])
    }
    
    func testExampleNine() {
        XCTAssertEqual(solution.insert([[0,5],[9,12]], [7,16]), [[0,5],[7,16]])
    }
}

SolutionTests.defaultTestSuite.run()

