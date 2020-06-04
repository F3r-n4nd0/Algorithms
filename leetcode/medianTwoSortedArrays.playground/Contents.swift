import Foundation
import XCTest

/*
 Median of Two Sorted Arrays
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 You may assume nums1 and nums2 cannot be both empty.
 */

class Solution {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nTotalNumber = nums1.count + nums2.count
        let isPair = nTotalNumber % 2 == 0
        var index1 = -1, index2 = -1
        var end = nTotalNumber/2
        var currentVal = -1, lastVal = -1
        while end >= 0  {
            let nextIndex1 = nums1.count > (index1+1) ? (index1+1) : -1
            let nextIndex2 = nums2.count > (index2+1) ? (index2+1) : -1
            if nextIndex1 < 0 {
                lastVal = currentVal
                currentVal = nums2[nextIndex2]
                index2 = nextIndex2
            } else if nextIndex2 < 0 {
                lastVal = currentVal
                currentVal = nums1[nextIndex1]
                index1 = nextIndex1
            } else if nums1[nextIndex1] > nums2[nextIndex2] {
                lastVal = currentVal
                currentVal = nums2[nextIndex2]
                index2 = nextIndex2
            } else {
                lastVal = currentVal
                currentVal = nums1[nextIndex1]
                index1 = nextIndex1
            }
            end -= 1
        }
        return  isPair ? Double(lastVal + currentVal) / 2.0 : Double(currentVal)
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.findMedianSortedArrays([1, 3], [2]), 2)
        XCTAssertEqual(solution.findMedianSortedArrays([1, 2], [3, 4]), 2.5)
        XCTAssertEqual(solution.findMedianSortedArrays([3], [-1, -3]), -1)
        XCTAssertEqual(solution.findMedianSortedArrays([2], []), 2)
        XCTAssertEqual(solution.findMedianSortedArrays([], [2,3]), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

