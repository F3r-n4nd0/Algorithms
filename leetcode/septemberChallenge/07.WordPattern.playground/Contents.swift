import Foundation
import XCTest

/*
 Word Pattern
 
 Given a pattern and a string str, find if str follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
 */

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let patternIdx = Array(pattern).enumerated().reduce(into: [String.Element:[Int]]()) { $0[$1.element, default: []].append($1.offset) }.map{ $0.value }.sorted{ $0[0] > $1[0] }
        let strIdx = str.split(separator: " ").enumerated().reduce(into: [String.SubSequence:[Int]]()) { $0[$1.element, default: []].append($1.offset) }.map{ $0.value }.sorted{ $0[0] > $1[0] }
        guard patternIdx.count == strIdx.count else { return false }
        for i in 0..<patternIdx.count {
            guard patternIdx[i] == strIdx[i] else { return false }
        }
        return true
    }
}

class Solution2 {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let strArray = str.components(separatedBy: " ")
        guard strArray.count == pattern.count else { return false }
        var set:Set<String> = []
        var dict = [Character:String]()
        for (index,char) in pattern.enumerated() {
            if let entry = dict[char] {
                guard entry == strArray[index] else { return false }
                continue
            }
            guard !set.contains(strArray[index]) else { return false }
            dict[char] = strArray[index]
            set.insert(strArray[index])
            
        }
        return true
    }
}



class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.wordPattern("abba", "dog cat cat dog"), true)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.wordPattern("abba", "dog dog dog dog"), false)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.wordPattern("aaaa", "dog cat cat dog"), false)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.wordPattern("abba", "dog cat cat fish"), false)
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.wordPattern("abba", "dog cat dog cat"), false)
    }
    
    func testExampleSix() {
        XCTAssertEqual(solution.wordPattern("aba", "cat cat cat dog"), false)
    }
    
}

SolutionTests.defaultTestSuite.run()

