import UIKit

/*
 Check If a Word Occurs As a Prefix of Any Word in a Sentence
 
 Given a sentence that consists of some words separated by a single space, and a searchWord.

 You have to check if searchWord is a prefix of any word in sentence.

 Return the index of the word in sentence where searchWord is a prefix of this word (1-indexed).

 If searchWord is a prefix of more than one word, return the index of the first word (minimum index). If there is no such word return -1.

 A prefix of a string S is any leading contiguous substring of S.
 */

class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let words = sentence.split(separator: " ").map(String.init)
        for i in  0..<words.count {
            if words[i].hasPrefix(searchWord) { return i+1 }
        }
        return -1
    }
}
