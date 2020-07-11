import Foundation
import XCTest

/*
 Subsets
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.
 
 */

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]
        for i in 0..<nums.count {
            for num in result {
                var temp = num
                temp.append(nums[i])
                result.append(temp)
            }
        }
        return result
    }
}

let results = Solution().subsets([1,2,3])

for result in results {
    print(result)
}

