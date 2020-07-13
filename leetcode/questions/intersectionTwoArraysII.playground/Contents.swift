import Foundation
import XCTest

/*
 Intersection of Two Arrays II
 
 Given two arrays, write a function to compute their intersection.
 
 */

class Solution {
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count > 0 && nums2.count > 0 else { return [] }
        guard nums1.count <= nums2.count else { return intersect(nums2, nums1) }
        var dic2 = nums2.reduce(into: [Int:Int]()){ $0[$1, default: 0] += 1 }
        var result = [Int]()
        for num in nums1 {
            guard let count = dic2[num] else { continue }
            result.append(num)
            dic2[num]! -= 1
            if count == 1 { dic2.removeValue(forKey: num) }
        }
        return result
    }
    
}


class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.intersect([1,2,2,1], [2,2]), [2,2])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.intersect([], []), [])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.intersect([1], [1]), [1])
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.intersect([3,1,2], [1,1]), [1])
    }
    
}

SolutionTests.defaultTestSuite.run()

