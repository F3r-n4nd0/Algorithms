import Foundation
import XCTest

/*
 Bulls and Cows
 
 You are playing the following Bulls and Cows game with your friend: You write down a number and ask your friend to guess what the number is. Each time your friend makes a guess, you provide a hint that indicates how many digits in said guess match your secret number exactly in both digit and position (called "bulls") and how many digits match the secret number but locate in the wrong position (called "cows"). Your friend will use successive guesses and hints to eventually derive the secret number.

 Write a function to return a hint according to the secret number and friend's guess, use A to indicate the bulls and B to indicate the cows.

 Please note that both secret number and friend's guess may contain duplicate digits.
 
 Note: You may assume that the secret number and your friend's guess only contain digits, and their lengths are always equal.
 */

class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        guard secret.count == guess.count else { return "" }
        let secret = Array(secret)
        let guess = Array(guess)
        var bulls = 0, cows = 0
        var dicSecret = [String:Int](), dicGuess = [String: Int]()
        for i in 0..<secret.count {
            let currenSecret = String(secret[i])
            let currentGuess = String(guess[i])
            if currenSecret == currentGuess {
                bulls += 1
                continue
            }
            if let count = dicSecret[currentGuess], count > 0 {
                cows += 1
                dicSecret[currentGuess, default: 0] -= 1
            } else {
                dicGuess[currentGuess, default: 0] += 1
            }
            if let count = dicGuess[currenSecret], count > 0  {
                cows += 1
                dicGuess[currenSecret, default: 0] -= 1
            } else {
                dicSecret[currenSecret, default: 0] += 1
            }
        }
        return "\(bulls)A\(cows)B"
    }
}

class Solution2 {
    func getHint(_ secret: String, _ guess: String) -> String {
        let s = Array(secret)
        let g = Array(guess)
        var num = [Character : Int]()
        var bull = 0
        var cow = 0
        for i in 0 ..< s.count {
            if s[i] == g[i] {
                bull += 1
                continue
            }
            if num[s[i], default:0] < 0 {
                cow += 1
            }
            if num[g[i], default:0] > 0 {
                cow += 1
            }
            num[s[i], default:0] += 1
            num[g[i], default:0] -= 1
        }
        return "\(bull)A\(cow)B"
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.getHint("1807", "7810"), "1A3B")
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.getHint("1123", "0111"), "1A1B")
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.getHint("1123", "2311"), "0A4B")
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.getHint("1122", "2211"), "0A4B")
    }
    
    func testExampleFive() {
        XCTAssertEqual(solution.getHint("8226526357", "7965193296"), "0A6B")
    }
    
}

SolutionTests.defaultTestSuite.run()

