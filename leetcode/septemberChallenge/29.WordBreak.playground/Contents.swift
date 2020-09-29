import Foundation
import XCTest

/*
 Word Break
 
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
 
 Note:
 
 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 */

class Solution {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = Array(s)
        let wordArrDict = wordDict.reduce(into: [Character:[[Character]]]()){ $0[Array($1)[0], default: []].append(Array($1)) }
        return matchWords(s, wordArrDict, 0, s.count-1)
    }
    
    private func matchWords(_ s: [Character], _ wordArrDict:[Character:[[Character]]], _ startIndex: Int,_ endIndex: Int) -> Bool {
        guard let words = wordArrDict[s[startIndex]] else { return false }
        let max = endIndex-startIndex+1
        for word in words where word.count <= max && word == Array(s[startIndex..<startIndex+word.count]) {
            if startIndex+word.count-1 == endIndex { return true }
            if matchWords(s, wordArrDict, startIndex+word.count, endIndex) { return true }
        }
        return false
    }
    
}

class Solution2 {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.count > 0 else { return false }
        let lookup = Set(wordDict)
        let chars = Array<Character>(s)
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        for endIndex in 1...chars.count {
               for startIndex in 0..<endIndex {
                guard dp[startIndex] else { continue }
                if lookup.contains(String(chars[startIndex..<endIndex])) {
                    dp[endIndex] = true
                    break
                }
            }
        }
        return dp[s.count]
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.wordBreak("leetcode", ["leet", "code"]), true)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.wordBreak("catsandog", ["cats","dog","sand","and","cat"]), false)
    }

    func testExampleThree() {
        XCTAssertEqual(solution.wordBreak("applepenapple", ["apple","pen"]), true)
    }

    func testExampleFour() {
        XCTAssertEqual(solution.wordBreak("aaaaaaa", ["aaaa","aa"]), false)
    }
    
}

SolutionTests.defaultTestSuite.run()

