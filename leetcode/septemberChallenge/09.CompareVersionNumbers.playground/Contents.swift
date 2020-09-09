import Foundation
import XCTest

/*
 Compare Version Numbers
 
 Compare two version numbers version1 and version2.
 If version1 > version2 return 1; if version1 < version2 return -1;otherwise return 0.

 You may assume that the version strings are non-empty and contain only digits and the . character.

 The . character does not represent a decimal point and is used to separate number sequences.

 For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.

 You may assume the default revision number for each level of a version number to be 0. For example, version number 3.4 has a revision number of 3 and 4 for its first and second level revision number. Its third and fourth level revision number are both 0.
 */

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1 = version1.components(separatedBy: ".")
        let v2 = version2.components(separatedBy: ".")
        for i in 0..<max(v1.count, v2.count) {
            let v1current  = i < v1.count ? Int(v1[i]) ?? 0 : 0
            let v2current  = i < v2.count ? Int(v2[i]) ?? 0 : 0
            if v1current > v2current {
                return 1
            } else if v1current < v2current {
                return -1
            }
        }
        return 0
    }
}

class Solution2 {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var v1 = version1.components(separatedBy: ".")
        var v2 = version2.components(separatedBy: ".")
        if v1.count > v2.count{
            while(v1.count != v2.count){
                v2.append("0")
            }
        }
        else if v1.count < v2.count{
            while(v1.count != v2.count){
                v1.append("0")
            }
        }
        for i in 0..<v1.count{
            if Int(v1[i])! > Int(v2[i])!{
                return 1
            }
            else if Int(v1[i])! < Int(v2[i])!{
                return -1
            }
        }
        return 0
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.compareVersion("0.1", "1.1"), -1)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.compareVersion("1.0.1", "1"), 1)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.compareVersion("7.5.2.4", "7.5.3"), -1)
    }

}

SolutionTests.defaultTestSuite.run()

