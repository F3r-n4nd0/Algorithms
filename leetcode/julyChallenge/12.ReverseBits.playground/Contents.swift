import Foundation
import XCTest

/*
 Reverse bits of a given 32 bits unsigned integer.
 
 */

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var arrBytes = [Int]()
        while n > 0 {
            arrBytes.append(n%2)
            n = n / 2
        }
        let diff = 32 - arrBytes.count
        if diff > 0 {
            arrBytes.append(contentsOf: Array(repeating: 0, count: diff))
        }
        var result = 0
        for i in 0..<arrBytes.count {
            if arrBytes[i] == 1 {
                result += Int(truncating: NSDecimalNumber(decimal: pow(2, arrBytes.count-i-1)))
            }
        }
        return result
    }
}


class Solution2 {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var result = 0
        for _ in 0..<32  {
            result <<= 1
            result += n & 1
            n >>= 1
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.reverseBits(43261596), 964176192)
    }
    
}

SolutionTests.defaultTestSuite.run()
