import Foundation
import XCTest

/*
 Make The String Great
 
 Given a string s of lower and upper case English letters.

 A good string is a string which doesn't have two adjacent characters s[i] and s[i + 1] where:

 0 <= i <= s.length - 2
 s[i] is a lower-case letter and s[i + 1] is the same letter but in upper-case or vice-versa.
 To make the string good, you can choose two adjacent characters that make the string bad and remove them. You can keep doing this until the string becomes good.

 Return the string after making it good. The answer is guaranteed to be unique under the given constraints.

 Notice that an empty string is also good.
 
 */

class Solution {
    func makeGood(_ s: String) -> String {
        var arrS = s.map{ Int($0.asciiValue!) }
        var i = 0
        while i < arrS.count-1 {
            if 32 == abs(arrS[i] - arrS[i+1]) {
                arrS.remove(at: i)
                arrS.remove(at: i)
                i = 0
                continue
            }
            i += 1
        }
        return String(arrS.map{Character(UnicodeScalar($0)!)})
    }
}

class Solution2 {
    func makeGood(_ s: String) -> String {
        var stack : [Character] = []
        for c in s {
            guard !stack.isEmpty else {
                stack.append(c)
                continue
            }
            if stack.last?.uppercased() == String(c) && stack.last!.isLowercase && c.isUppercase {
                stack.popLast()
            }
            else if stack.last?.lowercased() == String(c) && c.isLowercase && stack.last!.isUppercase{
                stack.popLast()
            }
            else{
                stack.append(c)
            }
        }
        return String(stack)
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(Solution().makeGood("leEeetcode"), "leetcode")
    }
    
}

SolutionTests.defaultTestSuite.run()
