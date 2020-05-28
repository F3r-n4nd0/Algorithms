import Foundation
import XCTest

/*
 Find All Anagrams in a String
 
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
 
 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
 
 The order of output does not matter.
 
 */

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = s.map { $0.asciiValue ?? 0 }
        let p = p.map { $0.asciiValue ?? 0 }
        var ref = Array(repeating: 0, count: 256)
        for char in p {
            ref[Int(char)] += 1
        }
        var result = [Int]()
        var map = ref.map { _ in 0 }
        for i in 0..<s.count {
            map[Int(s[i])] += 1
            if i - p.count >= 0 {
                map[Int(s[i-p.count])] -= 1
            }
            if map == ref {
                result.append(i - p.count + 1)
            }
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
        XCTAssertEqual(solution.findAnagrams("cbaebabacd", "abc"), [0, 6])
        XCTAssertEqual(solution.findAnagrams("abab", "ab"), [0,1,2])
        XCTAssertEqual(solution.findAnagrams("baa", "aa"), [1])
    }
    
}

SolutionTests.defaultTestSuite.run()

