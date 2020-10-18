import Foundation
import XCTest

/*
 Common Child
 
 A string is said to be a child of a another string if it can be formed by deleting 0 or more characters from the other string. Given two strings of equal length, what's the longest string that can be constructed such that it is a child of both?
 For example, ABCD and ABDC have two children with maximum length 3, ABC and ABD. They can be formed by eliminating either the D or C from both strings. Note that we will not consider ABCD as a common child because we can't rearrange characters and ABCD  ABDC.

 */


class Solution {
    func commonChild(s1: String, s2: String) -> Int {
        var lcsArray = Array(repeating: 0, count: s2.count + 1)
        let left = Array(s1)
        let right = Array(s2)
        for i in 1...left.count {
            var last = 0
            for j in 1...right.count {
                let tmp = lcsArray[j]
                if left[i-1] == right[j-1] {
                    lcsArray[j] = last + 1
                } else {
                    lcsArray[j] = max(lcsArray[j-1], lcsArray[j])
                }
                last = tmp
            }
        }
        return lcsArray[s1.count]
    }
}

class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.commonChild(s1: "SHINCHAN", s2: "NOHARAAA"), 3)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.commonChild(s1: "OUDFRMYMAW", s2: "AWHYFCCMQX"), 2)
    }
    
}

SolutionTests.defaultTestSuite.run()
