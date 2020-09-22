import Foundation
import XCTest

/*
 Longest Palindrome Substring
 */

class Solution {
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
        let s = Array(s)
        var rangeMaxPalindrome = Range(0...0)
        for i in 0..<s.count {
            let max = min(i,s.count-1-i)
            if rangeMaxPalindrome.count/2 > max { continue }
            var range = maxPalindrome(s, i, i)
            if i+1 < s.count && s[i] == s[i+1]{
                let rangePairs = maxPalindrome(s, i, i+1)
                if rangePairs.count > range.count { range = rangePairs }
            }
            if range.count > rangeMaxPalindrome.count {
                rangeMaxPalindrome = range
                if rangeMaxPalindrome.count >= s.count {
                    break
                }
            }
        }
        return String(s[rangeMaxPalindrome])
    }

    
    private func maxPalindrome(_ s: [Character],_ left: Int,_ right: Int) -> Range<Int> {
        var left = left, right = right
        while left-1 >= 0 && right+1 < s.count && s[left-1] == s[right+1] {
            right += 1
            left -= 1
        }
        return Range(left...right)
    }
    
}

class Solution2 {
    
    func longestPalindrome(_ s: String) -> String {
        let input = Array(s)
        let len = s.count * 2 + 1
        var word = [Character](repeating: "?", count: len)
        var index: Int = 1
        for c in input {
            word[index] = c
            index += 2
        }
        var pal = [Int](repeating: 0, count: len)
        var resultLen: Int = 0
        var resultCenter: Int = 0
        var boundary: Int = 0
        var c: Int = 0
        index = 1
        while index < word.count {
            //Manacher shortcut.
            if index < boundary {
                let mirror = c * 2 - index
                pal[index] = min(pal[mirror], boundary - index)
            }
            //Start the expansion from where we know it's possible...
            var left = index - 1 - pal[index]
            var right = index + 1 + pal[index]
            while left >= 0 && right < word.count && word[left] == word[right] {
                pal[index] += 1
                left -= 1
                right += 1
            }
            //Do we have a new max in-creeping pally?
            if index + pal[index] > boundary {
                boundary = index + pal[index]
                c = index
            }
            //If this palindrome is longer than our current result,
            //then our current result becomes the palindrome centered
            //at 'index'
            if pal[index] > resultLen {
                resultLen = pal[index]
                resultCenter = index
            }
            index += 1
        }
        //Convert back into original string space...
        let resultIndex = (resultCenter - resultLen) / 2
        return String(input[resultIndex..<resultIndex+resultLen])
    }
    
}


class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        XCTAssertEqual(solution.longestPalindrome("ababa"), "ababa")
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.longestPalindrome("zababaggad"), "ababa")
    }
    
}

SolutionTests.defaultTestSuite.run()

