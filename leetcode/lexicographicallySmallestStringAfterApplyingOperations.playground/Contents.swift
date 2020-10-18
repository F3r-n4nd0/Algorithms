import Foundation
import XCTest

/*
 Lexicographically Smallest String After Applying Operations
 
 You are given a string s of even length consisting of digits from 0 to 9, and two integers a and b.

 You can apply either of the following two operations any number of times and in any order on s:

 Add a to all odd indices of s (0-indexed). Digits post 9 are cycled back to 0. For example, if s = "3456" and a = 5, s becomes "3951".
 Rotate s to the right by b positions. For example, if s = "3456" and b = 1, s becomes "6345".
 Return the lexicographically smallest string you can obtain by applying the above operations any number of times on s.

 A string a is lexicographically smaller than a string b (of the same length) if in the first position where a and b differ, string a has a letter that appears earlier in the alphabet than the corresponding letter in b. For example, "0158" is lexicographically smaller than "0190" because the first position they differ is at the third letter, and '5' comes before '9'.
 */

class Solution {
    
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        var seen = Set<String>()
        var need = [s]
        while let curr = need.popLast() {
            if !seen.contains(curr) {
                seen.insert(curr)
                need.append(contentsOf: [add(curr, a), rotate(curr, b)])
            }
        }
        return seen.min() ?? s
    }
    
    private func rotate(_ s: String, _ b: Int) -> String {
        return String(s.suffix(s.count-b) + s.prefix(b))
    }
    
    private func add(_ s: String, _ a: Int) -> String {
        var s = Array(s)
        let isPair = s.count % 2 == 0
        for i in stride(from: isPair ? 1 : 0 , to: s.count, by: +2)  {
            var num = Int(String(s[i]))!
            num += a
            if num > 9 { num -= 10}
            s[i] = Character(String(num))
        }
        return String(s)
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.findLexSmallestString("5525", 9, 2), "2050")
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.findLexSmallestString("74", 5, 1), "24")
    }
    
    func testExampleThee() {
        XCTAssertEqual(solution.findLexSmallestString("43987654", 7, 3), "00553311")
    }
    
}

SolutionTests.defaultTestSuite.run()
