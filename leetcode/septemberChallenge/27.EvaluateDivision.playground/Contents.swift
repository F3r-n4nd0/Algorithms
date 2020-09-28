import Foundation
import XCTest

/*
 Evaluate Division
 
 You are given equations in the format A / B = k, where A and B are variables represented as strings, and k is a real number (floating-point number). Given some queries, return the answers. If the answer does not exist, return -1.0.
 
 The input is always valid. You may assume that evaluating the queries will result in no division by zero and there is no contradiction.
 */

class Solution {
    
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        let conversion = zip(equations,values).reduce(into: [String:[(String,Double)]]()) {
            $0[$1.0[0], default: []].append(($1.0[1],$1.1))
            $0[$1.0[1], default: []].append(($1.0[0],1/$1.1))
        }
        var output = [Double]()
        output.reserveCapacity(queries.count)
        var visited = Set<String>()
        for query in queries {
            let dividend = query[0]
            let divisor = query[1]
            visited.removeAll()
            output.append(dfs(conversion, dividend, divisor, &visited))
        }
        return output
    }
    
    private func dfs(_ conversion: [String:[(String,Double)]], _ a: String,_ b: String,_ visited: inout Set<String>) -> Double {
        guard let optionsA = conversion[a], conversion.keys.contains(b) else { return -1 }
        guard a != b else { return 1 }
        visited.insert(a)
        for (char, value) in optionsA {
            if !visited.contains(char) {
                let output = dfs(conversion, char, b, &visited)
                if output != -1 {
                    return output * value
                }
            }
        }
        return -1
    }
    
}


class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.calcEquation(
                        [["a","b"],["b","c"]],
                        [2.0,3.0],
                        [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]),
                       [6.00000,0.50000,-1.00000,1.00000,-1.00000])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.calcEquation(
                        [["a","b"],["b","c"],["bc","cd"]],
                        [1.5,2.5,5.0],
                        [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]),
                       [3.75000,0.40000,5.00000,0.20000])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.calcEquation(
                        [["a","b"]],
                        [0.5],
                        [["a","b"],["b","a"],["a","c"],["x","y"]]),
                       [0.50000,2.00000,-1.00000,-1.00000])
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.calcEquation(
                        [["a","e"],["b","e"]],
                        [4.0,3.0],
                        [["a","b"],["e","e"],["x","x"]]),
                       [1.3333333333333333,1.00000,-1.00000])
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.calcEquation(
                        [["x1","x2"],["x2","x3"],["x3","x4"],["x4","x5"]],
                        [3.0,4.0,5.0,6.0],
                        [["x1","x5"],["x5","x2"],["x2","x4"],["x2","x2"],["x2","x9"],["x9","x9"]]),
                       [360.00000,0.008333333333333333,20.00000,1.00000,-1.00000,-1.00000])
    }

}



SolutionTests.defaultTestSuite.run()



