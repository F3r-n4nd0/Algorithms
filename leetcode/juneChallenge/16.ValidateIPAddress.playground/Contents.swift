import Foundation
import XCTest

/*
 Validate IP Address
 
 Write a function to check whether an input string is a valid IPv4 address or IPv6 address or neither.

 IPv4 addresses are canonically represented in dot-decimal notation, which consists of four decimal numbers, each ranging from 0 to 255, separated by dots ("."), e.g.,172.16.254.1;

 Besides, leading zeros in the IPv4 is invalid. For example, the address 172.16.254.01 is invalid.

 IPv6 addresses are represented as eight groups of four hexadecimal digits, each group representing 16 bits. The groups are separated by colons (":"). For example, the address 2001:0db8:85a3:0000:0000:8a2e:0370:7334 is a valid one. Also, we could omit some leading zeros among four hexadecimal digits and some low-case characters in the address to upper-case ones, so 2001:db8:85a3:0:0:8A2E:0370:7334 is also a valid IPv6 address(Omit leading zeros and using upper cases).

 However, we don't replace a consecutive group of zero value with a single empty group using two consecutive colons (::) to pursue simplicity. For example, 2001:0db8:85a3::8A2E:0370:7334 is an invalid IPv6 address.

 Besides, extra leading zeros in the IPv6 is also invalid. For example, the address 02001:0db8:85a3:0000:0000:8a2e:0370:7334 is invalid.

 Note: You may assume there is no extra space or special characters in the input string.
 */


enum ValidationError: Error {
    case invalidIP
}

enum TypeIPAddress {
    case v4
    case v6
}

extension TypeIPAddress {
    var description : String {
        switch self {
        case .v4: return "IPv4"
        case .v6: return "IPv6"
        }
    }
    
    var separator : Character {
        switch self {
        case .v4: return "."
        case .v6: return ":"
        }
    }
}

struct IPAddress {
    
    var type: TypeIPAddress
    var ip: String?
    
    init(_ text: String) throws {
        if IPAddress.validaIPv4(text) {
            self.type = .v4
        } else if IPAddress.validaIPv6(text) {
            self.type = .v6
        } else {
            throw ValidationError.invalidIP
        }
        self.ip = text
    }
    
    static func validaIPv4(_ text: String) -> Bool {
        let numbers = text.split(separator: TypeIPAddress.v4.separator,
                                 omittingEmptySubsequences: false)
        if numbers.count != 4 { return false }
        for number in numbers {
            if number.isEmpty ||
                number.count > 1 && number.prefix(1) == "0" ||
                number.count > 3 {
                return false
            }
            for c in number {
                if c < "0" || c > "9" { return false }
            }
            guard let num = Int(number) else { return false }
            if num < 0 || num > 255 { return false }
        }
        return true
    }
    
    static func validaIPv6(_ text: String) -> Bool {
        let numbers = text.split(separator: TypeIPAddress.v6.separator,
                                 omittingEmptySubsequences: false)
        if numbers.count != 8 { return false }
        for number in numbers {
            if number.isEmpty ||
                number.count > 4 { return false }
            for c in number {
                if !(c >= "0" && c <= "9") &&
                    !(c >= "a" && c <= "f") &&
                    !(c >= "A" && c <= "F") { return false }
            }
            guard let _ = UInt(number, radix: 16) else {
                return false
            }
        }
        return true
    }
}


class Solution {
    func validIPAddress(_ IP: String) -> String {
        guard let ipAddress = try? IPAddress(IP) else {
            return "Neither"
        }
        return ipAddress.type.description
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.validIPAddress("2001:0db8:85a3:00000:0:8A2E:0370:7334"), "Neither")
        XCTAssertEqual(solution.validIPAddress("172.16.254.1"), TypeIPAddress.v4.description)
        XCTAssertEqual(solution.validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334"), TypeIPAddress.v6.description)
        XCTAssertEqual(solution.validIPAddress("256.256.256.256"), "Neither")
        XCTAssertEqual(solution.validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334:"), "Neither")
        XCTAssertEqual(solution.validIPAddress("01.01.01.01"), "Neither")
        XCTAssertEqual(solution.validIPAddress("256.256.256.256"), "Neither")
        XCTAssertEqual(solution.validIPAddress("0.0.0.-0"), "Neither")
        XCTAssertEqual(solution.validIPAddress("1081:db8:85a3:01:-0:8A2E:0370:7334"), "Neither")
    }
    
}

SolutionTests.defaultTestSuite.run()

