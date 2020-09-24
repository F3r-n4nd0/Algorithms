import Foundation
import XCTest

/*
 Gas Station
 
 There are N gas stations along a circular route, where the amount of gas at station i is gas[i].

 You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.

 Return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1.

 Note:

 If there exists a solution, it is guaranteed to be unique.
 Both input arrays are non-empty and have the same length.
 Each element in the input arrays is a non-negative integer.
 
 */

class Solution {
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        guard gas.count > 0 else { return -1 }
        guard gas.count != 1 else { return gas[0] >= cost[0] ? 0 : -1 }
        let n = gas.count
        for i in 0..<n {
            if gas[i] > cost[i] && validateTravel(gas, cost, i) { return i }
        }
        return -1
    }
    
    private func validateTravel(_ gas: [Int], _ cost: [Int], _ i: Int) -> Bool {
        var tank = gas[i] - cost[i]
        for j in 1..<gas.count {
            let index = (i+j) % gas.count
            if tank + gas[index] < cost[index] {
                return false
            }
            tank += gas[index] - cost[index]
        }
        return true
    }
    
}

class Solution2 {
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let n = gas.count
        var index = 0, gasTank = 0, sum = 0
        for i in 0..<n {
            let currenDiff = gas[i] - cost[i]
            gasTank += currenDiff
            sum += currenDiff
            if gasTank < 0 {
                index = i + 1
                gasTank = 0
            }
        }
        return (sum >= 0) ? index : -1
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.canCompleteCircuit([1,2,3,4,5],
                                                   [3,4,5,1,2]), 3)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.canCompleteCircuit([2,3,4],
                                                   [3,4,3]), -1)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.canCompleteCircuit([3,1,1],
                                                   [1,2,2]), 0)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.canCompleteCircuit([2],
                                                   [2]), 0)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.canCompleteCircuit([5,1,2,3,4],
                                                   [4,4,1,5,1]), 4)
    }
    
}

SolutionTests.defaultTestSuite.run()

