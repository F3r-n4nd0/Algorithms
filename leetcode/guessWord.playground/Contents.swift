import Foundation
import XCTest

/*
 Guess the Word
 
 This problem is an interactive problem new to the LeetCode platform.
 
 We are given a word list of unique words, each word is 6 letters long, and one word in this list is chosen as secret.
 
 You may call master.guess(word) to guess a word.  The guessed word should have type string and must be from the original list with 6 lowercase letters.
 
 This function returns an integer type, representing the number of exact matches (value and position) of your guess to the secret word.  Also, if your guess is not in the given wordlist, it will return -1 instead.
 
 For each test case, you have 10 guesses to guess the word. At the end of any number of calls, if you have made 10 or less calls to master.guess and at least one of these guesses was the secret, you pass the testcase.
 
 Besides the example test case below, there will be 5 additional test cases, each with 100 words in the word list.  The letters of each word in those testcases were chosen independently at random from 'a' to 'z', such that every word in the given word lists is unique.
 
 */

/**
 * // This is the Master's API interface.
 * // You should not implement it, or speculate about its implementation
 * class Master {
 *     public func guess(word: String) -> Int {}
 * }
 */

class Master {
    
    var key: String
    var counter = 0
    
    init(key: String) {
        self.key = key
    }
    
    public func guess(_ word: String) -> Int {
        counter += 1
        var count = 0
        for i in 0..<word.count {
            if Array(key)[i] == Array(word)[i] {
                count += 1
            }
        }
        print("word: \(word) coincidences: \(counter)")
        return count
    }
    
}

class Solution {
    
    func findSecretWord(_ wordlist: [String], _ master: Master) {
        var wordlist = wordlist
        wordlist.sort()
        var guesses = [([String.Element], Int)] ()
        let lastGuess = master.guess(wordlist[0])
        if lastGuess == 6 { return }
        guesses.append((Array(wordlist[0]), lastGuess))
        for i in 1..<wordlist.count {
            let currentWord = Array(wordlist[i])
            var needToCheck = true
            for (w, g) in guesses {
                let coincidences = zip(w,currentWord).reduce(into:0) { $0 += $1.0 == $1.1 ? 1 : 0 }
                if (g == 0 && coincidences > 0) || coincidences < g  {
                    needToCheck = false
                    break
                }
            }
            if !needToCheck { continue }
            let currentGuess = master.guess(wordlist[i])
            if currentGuess == 6 { return }
            guesses.append((currentWord, currentGuess))
        }
    }
    
}

Solution().findSecretWord(["wichbx","oahwep","tpulot","eqznzs","vvmplb","eywinm","dqefpt","kmjmxr","ihkovg","trbzyb","xqulhc","bcsbfw","rwzslk","abpjhw","mpubps","viyzbc","kodlta","ckfzjh","phuepp","rokoro","nxcwmo","awvqlr","uooeon","hhfuzz","sajxgr","oxgaix","fnugyu","lkxwru","mhtrvb","xxonmg","tqxlbr","euxtzg","tjwvad","uslult","rtjosi","hsygda","vyuica","mbnagm","uinqur","pikenp","szgupv","qpxmsw","vunxdn","jahhfn","kmbeok","biywow","yvgwho","hwzodo","loffxk","xavzqd","vwzpfe","uairjw","itufkt","kaklud","jjinfa","kqbttl","zocgux","ucwjig","meesxb","uysfyc","kdfvtw","vizxrv","rpbdjh","wynohw","lhqxvx","kaadty","dxxwut","vjtskm","yrdswc","byzjxm","jeomdc","saevda","himevi","ydltnu","wrrpoc","khuopg","ooxarg","vcvfry","thaawc","bssybb","ccoyyo","ajcwbj","arwfnl","nafmtm","xoaumd","vbejda","kaefne","swcrkh","reeyhj","vmcwaf","chxitv","qkwjna","vklpkp","xfnayl","ktgmfn","xrmzzm","fgtuki","zcffuv","srxuus","pydgmq"], Master(key: "ccoyyo")
)
