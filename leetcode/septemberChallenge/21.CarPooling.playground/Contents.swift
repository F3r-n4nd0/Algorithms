import Foundation
import XCTest

/*
 Car Pooling
 
 You are driving a vehicle that has capacity empty seats initially available for passengers.  The vehicle only drives east (ie. it cannot turn around and drive west.)
 
 Given a list of trips, trip[i] = [num_passengers, start_location, end_location] contains information about the i-th trip: the number of passengers that must be picked up, and the locations to pick them up and drop them off.  The locations are given as the number of kilometers due east from your vehicle's initial location.
 
 Return true if and only if it is possible to pick up and drop off all passengers for all the given trips.
 */

class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var allTrip = [Int:Int]()
        for i in trips.indices {
            let trip = trips[i]
            let numPassangers = trip[0]
            let startLocation = trip[1]
            let endLocation = trip[2]
            for j in startLocation..<endLocation {
                allTrip[j, default:0] += numPassangers
            }
        }
        let max = allTrip.max{ $0.value < $1.value }
        guard let maxValue = max?.value else { return false }
        return capacity >= maxValue
    }
}

class Solution2 {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var distance = 0
        for trip in trips {
            distance = max(distance, trip[2])
        }
        var route = Array(repeating: 0, count: distance + 1)
        for trip in trips {
            route[trip[1]] += trip[0]
            route[trip[2]] -= trip[0]
        }
        for i in 1...distance {
            route[i] += route[i - 1]
            if route[i] > capacity {
                return false
            }
        }
        return true
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.carPooling([[2,1,5],[3,3,7]], 4), false)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.carPooling([[2,1,5],[3,3,7]], 5), true)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.carPooling([[2,1,5],[3,5,7]], 3), true)
    }
    
    func testExampleFour() {
        XCTAssertEqual(solution.carPooling([[3,2,7],[3,7,9],[8,3,9]], 11), true)
    }
    
}

SolutionTests.defaultTestSuite.run()

