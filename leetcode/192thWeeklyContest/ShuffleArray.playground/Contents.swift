import Foundation
import XCTest

/*
 Shuffle the Array
 
 Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

 Return the array in the form [x1,y1,x2,y2,...,xn,yn].
 
 */

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: nums.count)
        for i in 0..<n {
            let currentValue = nums[i]
            result[i*2] = currentValue
            let nextValue = nums[i+n]
            result[(i*2)+1] = nextValue
        }
        return result
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.shuffle([2,5,1,3,4,7], 3), [2,3,5,4,1,7] )
    }
    
}

SolutionTests.defaultTestSuite.run()

