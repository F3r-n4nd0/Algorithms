import Foundation
import XCTest

/*
 Reconstruct Itinerary
 
 Given a list of airline tickets represented by pairs of departure and arrival airports [from, to], reconstruct the itinerary in order. All of the tickets belong to a man who departs from JFK. Thus, the itinerary must begin with JFK.
 
 Note:
 
 If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string. For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
 All airports are represented by three capital letters (IATA code).
 You may assume all tickets form at least one valid itinerary.
 One must use all the tickets once and only once.
 
 */

class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var adj = [String: [String]]()
        tickets.forEach { edge in adj[edge[0], default: []].append(edge[1]) }
        adj.forEach { k, _ in adj[k]!.sort(by: >) }
        
        var route = [String]()
        func dfs(_ u: String) {
            if adj[u] != nil {
                while let next = adj[u]!.last {
                    adj[u]!.removeLast()
                    dfs(next)
                }
            }
            route.append(u)
        }
        dfs("JFK")
        return route.reversed()
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]), ["JFK", "MUC", "LHR", "SFO", "SJC"])
    }
    
}

SolutionTests.defaultTestSuite.run()

