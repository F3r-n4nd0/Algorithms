import Foundation
import XCTest

/*
 4Sum II
 
 Given four lists A, B, C, D of integer values, compute how many tuples (i, j, k, l) there are such that A[i] + B[j] + C[k] + D[l] is zero.

 To make problem a bit easier, all A, B, C, D have same length of N where 0 ≤ N ≤ 500. All integers are in the range of -228 to 228 - 1 and the result is guaranteed to be at most 231 - 1.
 */

class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var result = 0
        var partialTuples = [Int:Int]()
        for a in A {
            for b in B {
                partialTuples[a+b, default: 0] += 1
            }
        }
        for c in C {
            for d in D {
                if let zeroCount = partialTuples[-(c+d)] { result += zeroCount }
            }
        }
        return result
     }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.fourSumCount([ 1, 2], [-2,-1], [-1, 2], [ 0, 2]), 2)
    }
    
}

SolutionTests.defaultTestSuite.run()

