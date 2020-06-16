import Foundation
import XCTest

/*
 Cheapest Flights Within K Stops
 
 There are n cities connected by m flights. Each flight starts from city u and arrives at v with a price w.
 
 Now given all the cities and flights, together with starting city src and the destination dst, your task is to find the cheapest price from src to dst with up to k stops. If there is no such route, output -1.
 */

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var flightsOfN = [Int:[(Int,Int)]]()
        for flight in flights {
            flightsOfN[flight[0], default:[(Int,Int)]()].append((flight[1], flight[2]))
        }
        var result = Int.max
        var queue = [(Int,Int)]()//dst, cost
        queue.append((src,0))
        var count = K+1
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                if cur.0 == dst {
                    result = min(result, cur.1)
                }
                if flightsOfN[cur.0] != nil {
                    for flight in flightsOfN[cur.0]! {
                        //prunning
                        if cur.1 + flight.1 >= result {
                            continue
                        }
                        queue.append((flight.0, cur.1 + flight.1))
                    }
                }
            }
            count -= 1
            if count < 0 {
                break
            }
        }
        return result == Int.max ? -1 : result
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1), 200)
        XCTAssertEqual(solution.findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0), 500)
        
    }
    
}

SolutionTests.defaultTestSuite.run()

