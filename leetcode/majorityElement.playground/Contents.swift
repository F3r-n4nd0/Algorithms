import Foundation
import XCTest

/*
 Majority Element
 
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.
 
 */

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {  return 0 }
        let n = nums.count / 2
        if n == 0  && nums.count > 0 { return nums.max() ?? 0 }
        var output = Int.min
        var hashTable = [Int:Int]()
        for num in nums {
            hashTable[num, default: 0] += 1
            if let val = hashTable[num], val > n {
                if num > output { output = num }
            }
        }
        return output
    }
}

class Solution2 {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {  return 0 }
        let n = nums.count / 2
        if n == 0  && nums.count > 0 { return nums.max() ?? 0 }
        var output = Int.min
        var hashTable = [Int:Int]()
        for num in nums {
            hashTable[num, default: 0] += 1
            if let val = hashTable[num], val > n {
                if num > output { output = num }
            }
        }
        return output
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.majorityElement([3,2,3]), 3)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.majorityElement([2,2,1,1,1,2,2]), 2)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.majorityElement([-2147483648]), -2147483648)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.majorityElement([2147483647,-1,-1]), -1)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.majorityElement([1,1,2,2,2,1,1]), 1)
    }
    
    
}

SolutionTests.defaultTestSuite.run()

