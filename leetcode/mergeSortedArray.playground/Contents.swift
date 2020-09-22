import Foundation
import XCTest

/*
 Merge Sorted Array
 
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard n > 0 else { return }
        guard m > 0 else {
            nums1 = nums2
            return
        }
        var m = m-1
        var n = n-1
        var i = nums1.count-1
        while m >= 0, n >= 0 {
            if nums1[m] > nums2[n] {
                nums1[i] = nums1[m]
                m -= 1
            } else {
                nums1[i] = nums2[n]
                n -= 1
            }
            i -= 1
        }
        while m >= 0 {
            nums1[i] = nums1[m]
            m -= 1
            i -= 1
        }
        while n >= 0 {
            nums1[i] = nums2[n]
            n -= 1
            i -= 1
        }
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        var arr = [1,2,3,0,0,0]
        solution.merge(&arr, 3, [2,5,6], 3)
        XCTAssertEqual(arr, [1,2,2,3,5,6])
    }
    
    func testExampleTwo() {
        var arr = [0,0,0]
        solution.merge(&arr, 0, [2,5,6], 3)
        XCTAssertEqual(arr, [2,5,6])
    }
    
    func testExampleThree() {
        var arr = [-1,0,0,3,3,3,0,0,0]
        solution.merge(&arr, 6, [1,2,2], 3)
        XCTAssertEqual(arr, [-1, 0, 0, 1, 2, 2, 3, 3, 3])
    }
}

SolutionTests.defaultTestSuite.run()

