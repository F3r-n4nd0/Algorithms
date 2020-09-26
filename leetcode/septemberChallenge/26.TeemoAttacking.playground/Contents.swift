import Foundation
import XCTest

/*
 Teemo Attacking
 
 In LOL world, there is a hero called Teemo and his attacking can make his enemy Ashe be in poisoned condition. Now, given the Teemo's attacking ascending time series towards Ashe and the poisoning time duration per Teemo's attacking, you need to output the total time that Ashe is in poisoned condition.

 You may assume that Teemo attacks at the very beginning of a specific time point, and makes Ashe be in poisoned condition immediately.
 */

class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        guard timeSeries.count > 0 else { return 0 }
        var output = 0
        for i in 0..<timeSeries.count-1{
            output += timeSeries[i+1] - timeSeries[i] <= duration ? timeSeries[i+1] - timeSeries[i] : duration
        }
        return output + duration
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.findPoisonedDuration([1,4], 2), 4)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.findPoisonedDuration([1,2], 2), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

