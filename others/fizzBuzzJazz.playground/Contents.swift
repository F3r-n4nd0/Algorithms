import Foundation
import XCTest

/*
 FizzBuzzJazz
 
 But for multiples of three it should output “Fizz” instead of the number, for the multiples of five output “Buzz” and for the multiples of seven output “Jazz”. For numbers which are multiples of both three and five output “FizzBuzz”, for numbers which are multiples of three and seven output “FizzJazz”, for numbers which are multiples of five and seven output “BuzzJazz”,  for multiples of three, five and seven output “FizzBuzzJazz” and so on.

 */

class Solution {
    func fizzBuzzJazz(_ n: Int) -> [String] {
        var output = [String]()
        for i in 1...n {
            var current = ""
            if i % 3 == 0 { current += "Fizz" }
            if i % 5 == 0 { current += "Buzz" }
            if i % 7 == 0 { current += "Jazz" }
            output.append(current.isEmpty ? String(i) : current)
        }
        return output
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.fizzBuzzJazz(21), [
            "1",
            "2",
            "Fizz",
            "4",
            "Buzz",
            "Fizz",
            "Jazz",
            "8",
            "Fizz",
            "Buzz",
            "11",
            "Fizz",
            "13",
            "Jazz",
            "FizzBuzz",
            "16",
            "17",
            "Fizz",
            "19",
            "Buzz",
            "FizzJazz"
        ]
)
    }
    
}

SolutionTests.defaultTestSuite.run()
