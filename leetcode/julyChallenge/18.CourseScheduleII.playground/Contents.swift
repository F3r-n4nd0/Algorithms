import Foundation
import XCTest

/*
 Course Schedule II
 
 There are a total of n courses you have to take, labeled from 0 to n-1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.

 There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.
 */

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var arr = [Int](repeating: 0, count: numCourses)
        var tmp = [[Int]](repeating: [Int](), count: numCourses)
        prerequisites.forEach({
            tmp[$0[1]].append($0[0])
            arr[$0[0]] += 1
        })
        var order = [Int]()
        var queue = [Int]()
        for i in 0..<numCourses {
            if arr[i] == 0 { queue.append(i) }
        }
        while !queue.isEmpty {
            let i = queue.removeFirst()
            order.append(i)
            for j in tmp[i] {
                arr[j] -= 1
                if arr[j] == 0 { queue.append(j) }
            }
        }
        for i in 0..<numCourses {
            if arr[i] != 0 { return [] }
        }
        return order
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.findOrder(2, [[1,0]] ), [0,1])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.findOrder(4, [[1,0],[2,0],[3,1],[3,2]] ), [0,1,2,3] ) // [0,2,1,3]
    }
    
}

SolutionTests.defaultTestSuite.run()

