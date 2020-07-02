import Foundation
import XCTest

/*
 Rotate Array

 Given an array, rotate the array to the right by k steps, where k is non-negative.

 Follow up:

 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 
 */

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k > 0 && nums.count > 0 else { return }
        for _ in 0..<k {
            guard let value = nums.popLast() else { return }
            nums.insert(value, at: 0)
        }
    }
}

class Solution2 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k > 0 && nums.count > 0 else { return }
        let k = k % nums.count
        nums = Array(nums[nums.count - k..<nums.count] + nums[0..<nums.count-k])
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution2!
    
    override func setUp() {
        super.setUp()
        solution = Solution2()
    }
    
    func testExampleOne() {
        var arr = [1,2,3,4,5,6,7]
        solution.rotate(&arr, 3)
        XCTAssertEqual(arr, [5,6,7,1,2,3,4])
    }
    
    func testExampleTwo() {
        var arr = [-1]
        solution.rotate(&arr, 2)
        XCTAssertEqual(arr, [-1])
    }
    
    func testExampleThree() {
        var arr = [1,2]
        solution.rotate(&arr, 3)
        XCTAssertEqual(arr, [2,1])
    }
    
}

SolutionTests.defaultTestSuite.run()

