import Foundation
import XCTest

/*
 Merge Sort: Counting Inversions
 
 https://www.hackerrank.com/challenges/ctci-merge-sort
 
 */

func mergesort(array: inout [Int]) -> Int {
    var temp = array
    return mergesort(array: &array, temp: &temp, start: 0, end: array.count - 1)
}

func mergesort(array: inout [Int], temp: inout [Int], start: Int, end: Int) -> Int {
    guard start < end else {
        return 0
    }
    var inversions = 0
    let center = (start + end) / 2
    inversions += mergesort(array: &array, temp: &temp, start: start, end: center)
    inversions += mergesort(array: &array, temp: &temp, start: center + 1, end: end)
    inversions += merge(array: &array, temp: &temp, start: start, center: center, end: end)
    return inversions
}

func merge(array: inout [Int], temp: inout [Int], start: Int, center: Int, end: Int) -> Int {
    var leftIndex = start
    let leftEndIndex = center + 1
    var rightIndex = leftEndIndex
    let rightEndIndex = end + 1
    var index = start
    var inversions = 0
    while leftIndex < leftEndIndex && rightIndex < rightEndIndex {
        if array[leftIndex] <= array[rightIndex] {
            temp[index] = array[leftIndex]
            leftIndex += 1
        }
        else {
            temp[index] = array[rightIndex]
            rightIndex += 1
            inversions += leftEndIndex - leftIndex
        }
        index += 1
    }
    
    if leftIndex < leftEndIndex {
        temp[index ... end] = array[leftIndex ... leftEndIndex - 1]
    }

    if rightIndex < rightEndIndex {
        temp[index ... end] = array[rightIndex ... rightEndIndex - 1]
    }
    
    array[start ... end] = temp[start ... end]
    return inversions
}


/*
 Solve timeout removing high-level string functions
 
 var n = Int(readLine()!)!

 while n > 0 {
     _ = Int(readLine()!)!
     var array = readLine()!.split(separator: " ").map { Int($0)! }
     print(mergesort(array: &array))

     n -= 1
 }
 
 */
class SolutionTests: XCTestCase {

    func testExampleOne() {
        var arr = [1, 1, 1, 2, 2]
        XCTAssertEqual(mergesort(array: &arr), 0)
    }

    func testExampleTwo() {
        var arr = [2, 1, 3, 1, 2]
        XCTAssertEqual(mergesort(array: &arr), 4)
    }

    func testExampleThree() {
        var arr = [1, 5 ,3, 7]
        XCTAssertEqual(mergesort(array: &arr), 1)
    }

    func testExampleFour() {
        var arr = [7, 5, 3, 1]
        XCTAssertEqual(mergesort(array: &arr), 6)
    }

}

SolutionTests.defaultTestSuite.run()
