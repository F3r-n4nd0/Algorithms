import Foundation
import XCTest

/*
 Sliding Window Maximum
 
 Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.
 
 */

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var leftMax = Array(repeating: 0, count: n)
        var rightMax = Array(repeating: 0, count: n)
        leftMax[0] = nums[0]
        for i in 1..<n{
            if i % k == 0{
                leftMax[i] = nums[i]
            }else{
                leftMax[i] = max(leftMax[i-1], nums[i])
            }
        }
        rightMax[n-1] = nums[n-1]
        for i in (0..<n-1).reversed(){
            if i % k == 0{
                rightMax[i] = nums[i]
            }else{
                rightMax[i] = max(rightMax[i+1], nums[i])
            }
        }
        var res:[Int] = []
        for i in 0..<n-k+1{
            res.append(max(rightMax[i], leftMax[i+k-1]))
        }
        return res
    }
}

class Solution2 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 && k > 0 else { return [] }
        var result = [Int]()
        var q = [Int]()
        for i in 0..<nums.count {
            while !q.isEmpty && q.first! < i-k+1 {
                q.removeFirst()
            }
            while !q.isEmpty && nums[q.last!] < nums[i] {
                q.removeLast()
            }
            q.append(i)
            if i >= k-1 {
                result.append(nums[q.first!])
            }
        }
        return result
        
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3), [3,3,5,5,6,7])
    }
    
//    func testExampleTwo() {
//        XCTAssertEqual(solution.maxSlidingWindow([1,-1], 1), [1,-1])
//    }
//
//    func testExampleThree() {
//        XCTAssertEqual(solution.maxSlidingWindow([1,3,1,2,0,5], 3), [3,3,2,5])
//    }
    
}

SolutionTests.defaultTestSuite.run()

