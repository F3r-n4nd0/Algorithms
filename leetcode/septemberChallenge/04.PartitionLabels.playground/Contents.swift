import Foundation
import XCTest

/*
 Partition Labels
 
 A string S of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.
 */

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        let n = S.count
        let S = S.utf8CString
        var maxIndexes = [CChar:Int]()
        for i in 0..<n {
            guard let valMax = maxIndexes[S[i]] else {
                maxIndexes[S[i]] = i
                continue
            }
            if valMax < i { maxIndexes[S[i]] = i }
        }
        var result = [Int]()
        var index = 0
        while index < n {
            guard var lastIndex = maxIndexes[S[index]] else {
                result.append(1)
                index += 1
                continue
            }
            var j = index
            while j < lastIndex {
                if let newMaxIndex = maxIndexes[S[j]], newMaxIndex > lastIndex {
                    lastIndex = newMaxIndex
                }
                j += 1
            }
           result.append(lastIndex-index+1)
           index = lastIndex + 1
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.partitionLabels("ababcbacadefegdehijhklij"), [9,7,8])
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.partitionLabels("qiejxqfnqceocmy"), [13,1,1])
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.partitionLabels("caedbdedda"), [1,9])
    }
    
}

SolutionTests.defaultTestSuite.run()

