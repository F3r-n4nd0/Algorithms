import Foundation
import XCTest

/*
 Largest Time for Given Digits
 
 Given an array of 4 digits, return the largest 24 hour time that can be made.
 
 The smallest 24 hour time is 00:00, and the largest is 23:59.  Starting from 00:00, a time is larger if more time has elapsed since midnight.
 
 Return the answer as a string of length 5.  If no valid time can be made, return an empty string.
 
 */

class Solution {
    
    private var maxTime = -1
    
    func largestTimeFromDigits(_ A: [Int]) -> String {
        maxTime = -1
        var array = A
        permutate(&array, start: 0)
        guard maxTime != -1 else { return "" }
        return String(format: "%02d:%02d", maxTime / 60, maxTime % 60)
    }
    
    private func permutate(_ array: inout [Int], start: Int) {
        guard array.count != start else {
            buildTime(array)
            return
        }
        for i in start..<array.count {
            array.swapAt(i, start)
            permutate(&array, start: start + 1)
            array.swapAt(i, start)
        }
    }
    
    private func buildTime(_ array: [Int]) {
        let hour = array[0] * 10 + array[1]
        let minute = array[2] * 10 + array[3]
        guard hour < 24, minute < 60 else { return }
        maxTime = max(maxTime, hour * 60 + minute)
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.largestTimeFromDigits([1,2,3,4]), "23:41")
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.largestTimeFromDigits([5,5,5,5]), "")
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.largestTimeFromDigits([0,0,1,0]), "10:00")
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.largestTimeFromDigits([0,1,1,0]), "11:00")
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.largestTimeFromDigits([0,4,0,0]), "04:00")
    }
    
    func testExampleSix() {
        XCTAssertEqual(solution.largestTimeFromDigits([2,0,6,6]), "06:26")
    }
    
    
}

SolutionTests.defaultTestSuite.run()

