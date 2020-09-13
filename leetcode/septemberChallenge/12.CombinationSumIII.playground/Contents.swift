import Foundation
import XCTest

/*
 Combination Sum III
 
 Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.
 */

class Solution {
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var ret = [[Int]]()
        recurse(k, n, 0, [Int](), 0, &ret)
        return ret
    }
    
    func recurse(_ count: Int, _ n: Int, _ partialSum: Int, _ nums: [Int], _ val: Int, _ ret: inout [[Int]]) {
        guard  count > 0  else {
            if partialSum + val == n { ret.append(nums + [val]) }
            return
        }
        if val+1 > 9 { return }
        for i in (val+1)...9 {
            if val + partialSum + i <= n {
                recurse(count-1, n, partialSum+val, val == 0 ? nums : nums + [val], i, &ret)
            }
        }
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.combinationSum3(3, 7), [[1,2,4]])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.combinationSum3(3, 9), [[1,2,6], [1,3,5], [2,3,4]])
    }
    
}

SolutionTests.defaultTestSuite.run()

