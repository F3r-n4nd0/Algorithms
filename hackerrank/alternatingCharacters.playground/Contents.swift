import Foundation
import XCTest

/*
 Alternating Characters
 
 https://www.hackerrank.com/challenges/alternating-characters/
 */

class Solution {
    func alternatingCharacters(s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var output = 0
        let s = Array(s)
        for i in 1..<s.count {
            if s[i] == s[i-1] {
                output += 1
            }
        }
        return output
    }
}

class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.alternatingCharacters(s: "ABABABAB"), 0)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.alternatingCharacters(s: "AAABBB"), 4)
    }
    
}

SolutionTests.defaultTestSuite.run()

