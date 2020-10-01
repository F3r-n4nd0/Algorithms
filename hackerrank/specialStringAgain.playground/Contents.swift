import Foundation
import XCTest

/*
 Special String Again
 
 https://www.hackerrank.com/challenges/special-palindrome-again/
 */

class Solution {
    func substrCount(n: Int, s: String) -> Int {
        let str = Array(s)
        var count: Int = n
        var repeatingCount: Int = 1
        for i in 1..<n {
            if str[i] == str[i-1] {
                repeatingCount += 1
            } else {
                for j in 1...repeatingCount {
                    if str.indices.contains(i-j) && str.indices.contains(i+j) && str[i-j] == str[i+j] {
                        count += 1
                    } else {
                        break
                    }
                }
            }
            if (str[i] != str[i-1] || i == n-1) && repeatingCount > 1 {
                count += ((repeatingCount-1)*repeatingCount)/2
                repeatingCount = 1
            }
        }
        return count
    }
}



class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.substrCount(n: 6, s: "aasasd"), 9)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.substrCount(n: 4, s: "aaaa"), 10)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.substrCount(n: 7, s: "abcbaba"), 10)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.substrCount(n: 8, s: "mnonopoo"), 12)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.substrCount(n: 6, s: "asasds"), 9)
    }
    
    func testExampleSix() {
        XCTAssertEqual(solution.substrCount(n: 9, s: "mnonoopoo"), 15)
    }
    
}

SolutionTests.defaultTestSuite.run()
