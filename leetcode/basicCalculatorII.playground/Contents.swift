import Foundation
import XCTest

/*
 Basic Calculator II
 
 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.
 */

class Solution {
    
    func calculate(_ s: String) -> Int {
        var num = 0
        var stack = [Int]()
        var op = "+"
        for char in s+"+" where char != " " {
            if let number = char.wholeNumberValue {
                num = num * 10 + number
            } else {
                switch op {
                case "+":
                    stack.append(num)
                case "-":
                    stack.append(-num)
                case "*":
                    stack.append(stack.removeLast() * num)
                case "/":
                    stack.append(stack.removeLast() / num)
                default: break
                }
                num = 0
                op = String(char)
            }
        }
        return stack.reduce(0, +)
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.calculate("3+2*2"), 7)
    }
    
//    func testExampleTwo() {
//        XCTAssertEqual(solution.calculate(" 3+5 / 2 "), 5)
//    }
    
}

SolutionTests.defaultTestSuite.run()

