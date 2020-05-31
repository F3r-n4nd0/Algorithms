
import Foundation
import XCTest

/*
 Make Two Arrays Equal by Reversing Sub-arrays
 
 Given two integer arrays of equal length target and arr.
 
 In one step, you can select any non-empty sub-array of arr and reverse it. You are allowed to make any number of steps.
 
 Return True if you can make arr equal to target, or False otherwise.
 
 */

class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        var arr = arr
        for i in 0..<arr.count-1 {
            let expected = target[i]
            let current = arr[i]
            if expected == current {
                continue
            }
            var index2: Int?
            for j in i..<arr.count {
                if expected == arr[j]  {
                    index2 = j
                    break
                }
            }
            guard let index = index2 else {
                return false
            }
            for j in (i..<index).reversed() {
                let removed = arr.remove(at: i)
                arr.insert(removed, at:j+1)
            }
        }
        return arr == target
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.canBeEqual([1,2,3,4], [2,4,1,3]), true)
    }
    
}

SolutionTests.defaultTestSuite.run()



