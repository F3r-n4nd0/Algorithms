import Foundation
import XCTest

/*
 Replace All ?'s to Avoid Consecutive Repeating Characters
 
 Given a string s containing only lower case English letters and the '?' character, convert all the '?' characters into lower case letters such that the final string does not contain any consecutive repeating characters. You cannot modify the non '?' characters.

 It is guaranteed that there are no consecutive repeating characters in the given string except for '?'.

 Return the final string after all the conversions (possibly zero) have been made. If there is more than one solution, return any of them. It can be shown that an answer is always possible with the given constraints.
 */

class Solution {
    private let characters = Array("abcdefghijklmnopqrstuwxyz")
    func modifyString(_ s: String) -> String {
        let s = Array(s)
        var result = [Character]()
        for i in 0..<s.count {
            if s[i] == "?" {
                var j = 0
                while (i+1 < s.count  && characters[j%25] == s[i+1]) || ( i-1 >= 0  && characters[j%25] == result[i-1]) {
                    j += 1
                }
                result += String(characters[j%25])
                continue
            }
            result += String(s[i])
        }
        return String(result)
    }
}


