import Foundation
import XCTest

/*
 Angle Between Hands of a Clock
 
 Given two numbers, hour and minutes. Return the smaller angle (in degrees) formed between the hour and the minute hand.

 */

class Solution {
    
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let hour = hour == 12 ? 0 : hour
        let angleMinutes = Double(minutes * 360) / 60.0
        let angleMinToHours = Double(minutes * 30) / 60.0
        let angleHour = (Double(hour * 360) / 12.0) + angleMinToHours
        let angle = abs(angleHour - angleMinutes)
        return angle >= 180 ? 360-angle : angle
    }
    
}

class Solution2 {
    
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let hour = hour == 12 ? 0 : hour
        let angle = abs(Double(30*hour) - Double(11*minutes)/2.0)
        return angle >= 180 ? 360-angle : angle
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.angleClock(12, 30), 165)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.angleClock(3, 30), 75)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.angleClock(3, 15), 7.5)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.angleClock(12, 0), 0)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.angleClock(1, 57), 76.5)
    }
    
}

SolutionTests.defaultTestSuite.run()

