import Foundation
import XCTest

/*
 Number Inversions
 
 This file contains all of the 100,000 integers between 1 and 100,000 (inclusive) in some order, with no integer repeated.

 Your task is to compute the number of inversions in the file given, where the ith row of the file indicates the ith entry of an array.

 Because of the large size of this array, you should implement the fast divide-and-conquer algorithm covered in the video lectures.

 The numeric answer for the given input file should be typed in the space below.

 */

class Solution {
    
    func numberInversions(_ array: inout [Int], _ l: Int, _ r: Int) -> Int {
        guard l < r else { return 0 }
        let m = (l + r) / 2
        return numberInversions(&array, m + 1, r) +
            numberInversions(&array, l, m) +
            merge(&array, l, m , r)
    }
    
    private func merge(_ array: inout [Int], _ l: Int, _ m: Int, _ r: Int) -> Int {
        let lArray = Array(array[l...m])
        let rArray = Array(array[m+1...r])
        var i = 0
        var j = 0
        var k = l
        var counter = 0
        while i < lArray.count, j < rArray.count {
            if lArray[i] <= rArray[j] {
                array[k] = lArray[i]
                i += 1
            } else {
                array[k] = rArray[j]
                counter += (lArray.count - i)
                j += 1
            }
            k += 1
        }
        for i in i..<lArray.count {
            array[k] = lArray[i]
            k += 1
        }
        for j in j..<rArray.count {
            array[k] = rArray[j]
            k += 1
        }
        return counter
    }
    

    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    private func readInputFile() -> [Int] {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else { fatalError() }
            let myStrings = try String(contentsOf: fileUrl, encoding: .utf8).split{ $0.isNewline }.map{ Int($0) ?? 0 }
            return myStrings
        } catch {
            print(error)
        }
        return []
    }
    
    func testExampleOne() {
        var arr = [7, 5, 3, 1]
        XCTAssertEqual(solution.numberInversions(&arr, 0, arr.count-1 ), 6)
    }
    
    func testExampleTwo() {
        var data = readInputFile()
        XCTAssertEqual(solution.numberInversions(&data, 0, data.count-1), 2407905288)
    }
    
}

SolutionTests.defaultTestSuite.run()

