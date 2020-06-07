import Foundation
import XCTest

/*
 The k Strongest Values in an Array
 
 Given an array of integers arr and an integer k.

 A value arr[i] is said to be stronger than a value arr[j] if |arr[i] - m| > |arr[j] - m| where m is the median of the array.
 If |arr[i] - m| == |arr[j] - m|, then arr[i] is said to be stronger than arr[j] if arr[i] > arr[j].

 Return a list of the strongest k values in the array. return the answer in any arbitrary order.

 Median is the middle value in an ordered integer list. More formally, if the length of the list is n, the median is the element in position ((n - 1) / 2) in the sorted list (0-indexed).

 For arr = [6, -3, 7, 2, 11], n = 5 and the median is obtained by sorting the array arr = [-3, 2, 6, 7, 11] and the median is arr[m] where m = ((5 - 1) / 2) = 2. The median is 6.
 For arr = [-7, 22, 17, 3], n = 4 and the median is obtained by sorting the array arr = [-7, 3, 17, 22] and the median is arr[m] where m = ((4 - 1) / 2) = 1. The median is 3.
 
 */

class Solution {
    func getStrongest(_ arr: [Int], _ k: Int) -> [Int] {
        let n = arr.count
        let arr = arr.sorted()
        let m = arr[(n - 1) / 2]
        let sortArr = arr.sorted{ abs($0 - m) >= abs($1 - m) }
        return Array(sortArr[0..<k])
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.getStrongest([1,2,3,4,5], 2), [5,1])
        XCTAssertEqual(solution.getStrongest([6,7,11,7,6,8], 5), [11,8,6,6,7])
        XCTAssertEqual(solution.getStrongest([-7,22,17,3], 2), [22,17])
    }
    
}

SolutionTests.defaultTestSuite.run()

