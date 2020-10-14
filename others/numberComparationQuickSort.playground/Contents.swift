import Foundation
import XCTest

/*
 Number Comparisons Quick Sort
 
 Your task is to compute the total number of comparisons used to sort the given input file by QuickSort. As you know, the number of comparisons depends on which elements are chosen as pivots, so we'll ask you to explore three different pivoting rules.

 You should not count comparisons one-by-one. Rather, when there is a recursive call on a subarray of length m, you should simply add m−1 to your running total of comparisons. (This is because the pivot element is compared to each of the other m−1 elements in the subarray in this recursive call.)
 
 */

class Solution {
    
    func numberComparisonsLowPivote(_ arr: inout [Int], _ low: Int, _ hight: Int) -> Int {
        guard hight > low else { return 0 }
        let pivote = arr[hight]
        var i = low
        for j in low+1...hight {
            if arr[j] < pivote {
                i += 1
                arr.swapAt(i, j)
            }
        }
        arr.swapAt(low,i)
        let a = numberComparisonsLowPivote(&arr, low, i-1)
        let b = numberComparisonsLowPivote(&arr, i+1, hight)
        return hight - low + a + b
    }
    
    func numberComparisonsHightPivote(_ arr: inout [Int], _ low: Int, _ hight: Int) -> Int {
        guard hight > low else { return 0 }
        arr.swapAt(hight, low)
        let pivote = arr[low]
        var i = low
        for j in low+1...hight {
            if arr[j] < pivote {
                i += 1
                arr.swapAt(i, j)
            }
        }
        arr.swapAt(low,i)
        print("\(low) \(hight) \(i)")
        let a = numberComparisonsHightPivote(&arr, low, i-1)
        let b = numberComparisonsHightPivote(&arr, i+1, hight)
        return hight - low + a + b
    }
    
    func numberComparisonsHightMedianOfThreePivote(_ arr: inout [Int], _ low: Int, _ hight: Int) -> Int {
        guard hight > low else { return 0 }
        let midIndex = (low+hight)>>1
        let pivoteIndex = [
            (low, arr[low]),
            (hight, arr[hight]),
            (midIndex, arr[midIndex])
        ].sorted{ $0.1 > $1.1 }[1].0
        arr.swapAt(pivoteIndex,low)
        let pivote = arr[low]
        var i = low
        for j in low+1...hight {
            if arr[j] < pivote {
                i += 1
                arr.swapAt(i, j)
            }
        }
        arr.swapAt(low,i)
        print("\(low) \(hight) \(i)")
        let a = numberComparisonsHightMedianOfThreePivote(&arr, low, i-1)
        let b = numberComparisonsHightMedianOfThreePivote(&arr, i+1, hight)
        return hight - low + a + b
    }
    
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    private func readInputFile() -> (Int,[Int]) {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else { fatalError() }
            var count = 0
            let myStrings = try String(contentsOf: fileUrl, encoding: .utf8).split{ $0.isNewline }.map{ val -> Int in
                count += 1
                return Int(val) ?? 0
            }
            return (count, myStrings)
        } catch {
            print(error)
        }
        return (0,[])
    }
    
    func testExampleOne() {
        var (n, arr) = readInputFile()
        print(n)
        XCTAssertEqual(solution.numberComparisonsLowPivote(&arr,0,n-1), 162085)
    }
    
    func testExampleTwo() {
        var (n, arr) = readInputFile()
        XCTAssertEqual(solution.numberComparisonsHightPivote(&arr,0,n-1), 164123)
    }
    
    func testExampleThree() {
        var (n, arr) = readInputFile()
        XCTAssertEqual(solution.numberComparisonsHightMedianOfThreePivote(&arr,0,n-1), 138382)
    }
    
}

SolutionTests.defaultTestSuite.run()

