import Foundation
import XCTest

/*
 Strings: Making Anagrams

 https://www.hackerrank.com/challenges/ctci-making-anagrams/
 */


class Solution {
    
    func makeAnagram(a: String, b: String) -> Int {
        var a = Array(a), b = Array(b)
        var i = 0
        while i < b.count {
            if let j  = a.firstIndex(of: b[i]) {
                a.remove(at: j)
                b.remove(at: i)
                continue
            }
            i += 1
        }
        return a.count + b.count
    }
    
}

class Solution2 {
    
    func makeAnagram(a: String, b: String) -> Int {
        var hashTable = a.reduce(into: [String:Int]()){ $0[String($1), default: 0] += 1 }
        hashTable = b.reduce(into: hashTable){ $0[String($1), default: 0] -= 1 }
        return hashTable.reduce(0) { $0 + abs($1.value) }
    }
    
}

class SolutionTests: XCTestCase {
    
    let solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.makeAnagram(a: "cde", b: "abc"), 4)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.makeAnagram(a: "fcrxzwscanmligyxyvym", b: "jxwtrhvujlmrpdoqbisbwhmgpmeoke"), 30)
    }
    
}

SolutionTests.defaultTestSuite.run()

