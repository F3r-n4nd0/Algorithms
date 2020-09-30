import Foundation
import XCTest

/*
 First Missing Positive
 
 Given an unsorted integer array, find the smallest missing positive integer.
 */

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let sortNums = Set(nums).filter{ $0 > 0 }.sorted()
        guard sortNums.count > 0 else { return 1 }
        guard sortNums[0] == 1 else { return 1 }
        var left = 0, right = sortNums.count-1
        while left < right {
            let mid = (left + right)>>1
            if sortNums[mid] == mid+1 && sortNums[mid+1] != mid+2 { return mid+2 }
            if  sortNums[mid] == mid+1 {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left+2
    }
}

class Solution2 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 1 }
        let setNums = Set(nums)
        for i in 1...nums.count+1 where !setNums.contains(i) {
            return i
        }
        return 0
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.firstMissingPositive([1,2,0]), 3)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.firstMissingPositive([3,4,-1,1]), 2)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.firstMissingPositive([7,8,9,11,12]), 1)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.firstMissingPositive([0]), 1)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.firstMissingPositive([1,1]), 2)
    }
    
    func testExampleSix() {
        XCTAssertEqual(solution.firstMissingPositive([4,2,0,1,4]), 3)
    }
    
    func testExampleSeven() {
        XCTAssertEqual(solution.firstMissingPositive([-1,-2]), 1)
    }
    
    func testExampleEight() {
        XCTAssertEqual(solution.firstMissingPositive([0,2,2,1,1]), 3)
    }
    
    func testExampleNine() {
        XCTAssertEqual(solution.firstMissingPositive([1]), 2)
    }
    
}

SolutionTests.defaultTestSuite.run()

