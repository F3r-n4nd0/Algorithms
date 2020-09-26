import Foundation
import XCTest

/*
 Largest Number
 
 Given a list of non negative integers, arrange them such that they form the largest number.
 */

class Solution {
    
    func largestNumber(_ nums: [Int]) -> String {
        let sortNums = nums.map{ String($0) }.sorted{ $0 + $1 > $1 + $0 }
        return sortNums.reduce(into:""){ if $0 != "0" || $1 != "0" { $0 += String($1) } }
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.largestNumber([10,2]), "210")
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.largestNumber([3,30,34,5,9]), "9534330")
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.largestNumber([20,1]), "201")
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.largestNumber([121,12]), "12121")
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.largestNumber([0,0]), "0")
    }
    
    func testExampleSix() {
        XCTAssertEqual(solution.largestNumber([824,938,1399,5607,6973,5703,9609,4398,8247]), "9609938824824769735703560743981399")
    }
}

SolutionTests.defaultTestSuite.run()
