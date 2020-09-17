import Foundation
import XCTest

/*
 Robot Bounded In Circle
 
 On an infinite plane, a robot initially stands at (0, 0) and faces north.  The robot can receive one of three instructions:
 
 "G": go straight 1 unit;
 "L": turn 90 degrees to the left;
 "R": turn 90 degress to the right.
 The robot performs the instructions given in order, and repeats them forever.
 
 Return true if and only if there exists a circle in the plane such that the robot never leaves the circle.
 */

class Robot {
    
    private let startOrientation: Orientation
    
    private var position = (0,0)
    private var currentOrientation: Orientation
    
    
    init(_ startOrientation: Orientation) {
        self.startOrientation = startOrientation
        self.currentOrientation = startOrientation
    }
    
    enum Orientation {
        case north
        case south
        case east
        case west
    }
    
    func moveForward() {
        switch currentOrientation {
        case .north:
            position.0 += 1
        case .south:
            position.0 -= 1
        case .east:
            position.1 += 1
        case .west:
            position.1 -= 1
        }
    }
    
    func turnLeft() {
        switch currentOrientation{
        case .north:
            currentOrientation = .west
        case .south:
            currentOrientation = .east
        case .east:
            currentOrientation = .north
        case .west:
            currentOrientation = .south
        }
    }
    
    func turnRight() {
        switch currentOrientation {
        case .north:
            currentOrientation = .east
        case .south:
            currentOrientation = .west
        case .east:
            currentOrientation = .south
        case .west:
            currentOrientation = .north
        }
    }
    
    func isBounded() -> Bool {
        return position == (0, 0) || currentOrientation != startOrientation
    }
    
}

class Solution {
    
    func isRobotBounded(_ instructions: String) -> Bool {
        let robot = Robot(.north)
        for cmd in instructions {
            switch cmd {
            case "G":
                robot.moveForward()
            case "L":
                robot.turnLeft()
            case "R":
                robot.turnRight()
            default:
                break
            }
        }
        return robot.isBounded()
    }
}

class Solution2 {
    func isRobotBounded(_ instructions: String) -> Bool {
        var pos = (0, 0)
        var dir = (0, 1)
        for cmd in instructions {
            switch cmd {
            case "G":
                pos.0 += dir.0
                pos.1 += dir.1
            case "L":
                dir = (-dir.1, dir.0)
            case "R":
                dir = (dir.1, -dir.0)
            default:
                break
            }
        }
        return (dir != (0, 1)) || (pos == (0, 0))
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.isRobotBounded("GGLLGG"), true)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.isRobotBounded("GG"), false)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.isRobotBounded("GL"), true)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.isRobotBounded("LLGRL"), true)
    }
    
}

SolutionTests.defaultTestSuite.run()

