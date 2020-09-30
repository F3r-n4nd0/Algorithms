import Foundation
import XCTest

/*
 Sherlock and the Valid String
 
 https://www.hackerrank.com/challenges/sherlock-and-valid-string/
 */

class Solution {
    
    func isValid(s: String) -> String {
        guard s.count > 2 else { return "YES" }
        let lookup = s.reduce(into: [Character:Int]()) { $0[$1, default: 0] += 1 }
        let status = lookup.reduce(into: [Int:Int]()) { $0[$1.value, default: 0] += 1 }
        let keys = Array(status.keys)
        if keys.count == 1 { return "YES" }
        if keys.count > 2 { return "NO" }
        if abs(keys[0] - keys[1]) == 1 && (1 == status[keys[0]] || 1 == status[keys[1]]) { return "YES" }
        if 1 == status[1] { return "YES" }
        return "NO"
    }
}
class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.isValid(s: "aabbcd"), "NO")
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.isValid(s: "abcdefghhgfedecba"), "YES")
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.isValid(s: "aabbcce"), "YES")
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.isValid(s: "abbbcce"), "NO")
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.isValid(s: "aaaaabc"), "NO")
    }
    
}

SolutionTests.defaultTestSuite.run()
