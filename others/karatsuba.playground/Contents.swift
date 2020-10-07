import Foundation
import XCTest

/*
 Karatsuba's algorithm
 
 */

struct BigInt {
    private let digits: [Int8]
}

extension BigInt: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.digits = value.reduce([Int8]()) {
            guard let int8Value = Int8(String($1)) else { fatalError("Can't handle non-numeric characters") }
            return [int8Value] + $0
        }
    }
}

extension BigInt {
    
    var length: Int {
        return digits.count
    }
    
    func digit(at index: UInt) -> Int8 {
        guard index < digits.count else {
            return 0
        }
        return digits[Int(index)]
    }
    
}

extension BigInt: CustomStringConvertible {
    var description: String {
        return digits.reduce("") { String($1) + $0 }
    }
}

extension BigInt {
    
    static func + (left: BigInt, right: BigInt) -> BigInt {
        var digits = [Int8]()
        var carry: Int8 = 0
        var i: UInt = 0
        let length = max(left.length, right.length)
        while i < length {
            let sum = left.digit(at: i) + right.digit(at: i) + carry
            digits.append(sum % 10)
            carry = sum > 9 ? 1 : 0
            i = i + 1
        }
        if carry > 0 {
            digits.append(carry)
        }
        return BigInt(digits: digits)
    }
    
    static func - (left: BigInt, right: BigInt) -> BigInt {
        var digits = [Int8]()
        var carry: Int8 = 0
        var i: UInt = 0
        let length = max(left.length, right.length)
        while i < length {
            var diff = left.digit(at: i) - right.digit(at: i) - carry
            if diff < 0 {
                diff = 10 + diff
                carry = 1
            }
            else {
                carry = 0
            }
            digits.append(diff)
            i = i + 1
        }
        if carry != 0 {
            fatalError("Can't handle negative numbers")
        }
        return BigInt(digits: digits)
    }
    
    static func << (left: BigInt, right: UInt) -> BigInt {
        var digits = left.digits
        for _ in 0..<right {
            digits.insert(0, at: 0)
        }
        return BigInt(digits: digits)
    }
    
    func split(with length: UInt, half: UInt) -> (BigInt, BigInt) {
        var b = [Int8]()
        var a = [Int8]()
        for i in 0..<length {
            if i < half {
                b.append(digit(at: i))
            }
            else {
                a.append(digit(at: i))
            }
        }
        return (BigInt(digits: a), BigInt(digits: b))
    }
    
    static func * (left: BigInt, right: BigInt) -> BigInt {
        let length = UInt(max(left.length, right.length))
        if length == 1 {
            let prod = left.digit(at: 0) * right.digit(at: 0)
            if prod < 10 {
                return BigInt(digits: [prod])
            }
            else {
                let d1 = prod % 10
                let d2 = (prod - d1) / 10
                return BigInt(digits: [d1, d2])
            }
        }
        let half_n = UInt(length/2)
        let (a, b) = left.split(with: length, half: half_n)
        let (c, d) = right.split(with: length, half: half_n)
        
        let ac = a * c
        let bd = b * d
        let ad_bc = (a + b) * (c + d) - ac - bd
        let res = (ac << (half_n * 2)) + (ad_bc << half_n) + bd
        return res
    }
}

class SolutionTests: XCTestCase {

    func testExampleOne() {
        let n1 = BigInt(stringLiteral: "3141592653589793238462643383279502884197169399375105820974944592")
        let n2 = BigInt(stringLiteral: "2718281828459045235360287471352662497757247093699959574966967627")
        XCTAssertEqual((n1*n2).description, "8539734222673567065463550869546574495034888535765114961879601127067743044893204848617875072216249073013374895871952806582723184")
    }
}

SolutionTests.defaultTestSuite.run()

