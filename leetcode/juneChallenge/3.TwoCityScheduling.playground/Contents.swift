import Foundation
import XCTest

/*
 Two City Scheduling
 
 There are 2N people a company is planning to interview. The cost of flying the i-th person to city A is costs[i][0], and the cost of flying the i-th person to city B is costs[i][1].

 Return the minimum cost to fly every person to a city such that exactly N people arrive in each city.
 */

class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var costsDiff = costs.map{
            ($0[0] - $0[1], $0)
        }
        costsDiff.sort{ $0.0 < $1.0}
        var maxPersons = costs.count/2
        return costsDiff.reduce(into:0) {
            if maxPersons == 0 {
                $0 += $1.1[1]
                return
            }
            $0 += $1.1[0]
            maxPersons -= 1
        }
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.twoCitySchedCost([[10,20],[30,200],[400,50],[30,20]]), 110)
        XCTAssertEqual(solution.twoCitySchedCost([[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]]), 1859)
    }
    
}

SolutionTests.defaultTestSuite.run()

