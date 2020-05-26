import UIKit
import XCTest

/*
 Verifying an Alien Dictionary
 In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.
 
 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.
 
 */

class Solution {
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let orderArray = Array(order)
        var lastWord = words[0]
        for i in 1..<words.count {
            let currentWord = words[i]
            let minCountChar = Swift.min(currentWord.count, lastWord.count)
            for j in 0..<minCountChar {
                let indexCurrent = Array(currentWord)[j]
                let indexLast = Array(lastWord)[j]
                let costCurrent = orderArray.firstIndex(of: indexCurrent) ?? 0
                let costLast = orderArray.firstIndex(of: indexLast) ?? 0
                if costCurrent > costLast { break }
                else if costCurrent < costLast ||
                    (j == minCountChar-1 && currentWord.count < lastWord.count)
                    { return false }
            }
            lastWord = currentWord
        }
        return true
    }
}


class SolutionTests: XCTestCase {
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.isAlienSorted(["hello","leetcode"],"hlabcdefgijkmnopqrstuvwxyz"), true)
        XCTAssertEqual(solution.isAlienSorted(["word","world","row"],"worldabcefghijkmnpqstuvxyz"), false)
        XCTAssertEqual(solution.isAlienSorted(["apple","app"],"abcdefghijklmnopqrstuvwxyz"), false)
        XCTAssertEqual(solution.isAlienSorted(["kuvp","q"],"ngxlkthsjuoqcpavbfdermiywz"), true)
        XCTAssertEqual(solution.isAlienSorted(["app","apple"],"abcdefghijklmnopqrstuvwxyz"), true)
        XCTAssertEqual(solution.isAlienSorted(["mtkwpj","wlaees"],"evhadxsqukcogztlnfjpiymbwr"), true)
        
    }
}

SolutionTests.defaultTestSuite.run()
