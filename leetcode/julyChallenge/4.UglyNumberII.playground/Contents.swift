import Foundation
import XCTest

/*
 Ugly Number II
 
 Write a program to find the n-th ugly number.

 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
 
 */

class Solution {
    
    func nthUglyNumber(_ n: Int) -> Int {
        var count = 0
        var number = 0
        while count < n {
            number += 1
            if isUglyNuumber(number) {
                count += 1
            }
        }
        return number
    }
    
    func isUglyNuumber(_ n: Int) -> Bool {
        var n = n
        while n % 2 == 0 {
            n = n / 2
        }
        while n % 3 == 0 {
            n = n / 3
        }
        while n % 5 == 0 {
            n = n / 5
        }
        return n == 1
    }
    
}

class Solution2 {
    
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var result = [Int](repeating: 1, count: n)
        var i2 = 0, i3 = 0, i5 = 0
        for i in 1..<n {
            result[i] = min(result[i2] * 2, result[i3] * 3, result[i5] * 5)
            if result[i] == result[i2] * 2 { i2 += 1 }
            if result[i] == result[i3] * 3 { i3 += 1 }
            if result[i] == result[i5] * 5 { i5 += 1 }
        }
        return result[n-1]
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution2!
    
    override func setUp() {
        super.setUp()
        solution = Solution2()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.nthUglyNumber(7), 8)
    }

    func testExampleTwo() {
        XCTAssertEqual(solution.nthUglyNumber(10), 12)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.nthUglyNumber(150), 5832)
    }
    
}

SolutionTests.defaultTestSuite.run()

