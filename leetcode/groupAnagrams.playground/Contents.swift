import Foundation
import XCTest

/*
 Group Anagrams
 
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let hash = strs.reduce(into: [[Character:Int]:[String]]()) { result, value in
            let key = value.reduce(into: [Character:Int]()) { $0[$1, default: 0] += 1 }
            result[key, default: []].append(value)
        }
        return hash.map{ $0.value }
    }
}

class Solution2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let hash = strs.reduce(into: [String:[String]]()) { $0[String($1.sorted()), default: []].append($1) }
        return hash.map{ $0.value }
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        let equal = solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"]).map{ $0.sorted(by: <) }.sorted{ $0.count < $1.count}
        XCTAssertEqual(equal, [["bat"],["nat","tan"],["ate","eat","tea"]])
    }
    
}

SolutionTests.defaultTestSuite.run()

