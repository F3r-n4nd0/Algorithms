import Foundation
import XCTest

/*
 Insert Delete GetRandom O(1)
 
 Design a data structure that supports all following operations in average O(1) time.
 
 insert(val): Inserts an item val to the set if not already present.
 remove(val): Removes an item val from the set if present.
 getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.
 
 Example:
 
 // Init an empty set.
 RandomizedSet randomSet = new RandomizedSet();
 
 // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomSet.insert(1);
 
 // Returns false as 2 does not exist in the set.
 randomSet.remove(2);
 
 // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomSet.insert(2);
 
 // getRandom should return either 1 or 2 randomly.
 randomSet.getRandom();
 
 // Removes 1 from the set, returns true. Set now contains [2].
 randomSet.remove(1);
 
 // 2 was already in the set, so return false.
 randomSet.insert(2);
 
 // Since 2 is the only number in the set, getRandom always return 2.
 randomSet.getRandom();
 
 */

class RandomizedSet {
    
    var dict: [Int:Int]
    var arr: [Int]
    
    /** Initialize your data structure here. */
    init() {
        self.dict = [Int:Int] ()
        self.arr = [Int] ()
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if dict[val] != nil { return false }
        arr.append(val)
        dict[val] = arr.count-1
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        guard let index = dict[val] else { return false }
        let lastVal = arr.removeLast()
        if index < arr.count {
            arr[index] = lastVal
            dict[lastVal] = index
        }
        dict.removeValue(forKey: val)
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return arr[Int.random(in: 0..<arr.count)]
    }
    
}

class SolutionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testExampleOne() {
        let randomSet = RandomizedSet()
        // Inserts 1 to the set. Returns true as 1 was inserted successfully.
        XCTAssertEqual(randomSet.insert(1), true)
        // Returns false as 2 does not exist in the set.
        XCTAssertEqual(randomSet.remove(2), false)
        // Inserts 2 to the set, returns true. Set now contains [1,2].
        XCTAssertEqual(randomSet.insert(2), true)
        // getRandom should return either 1 or 2 randomly.
        let random = randomSet.getRandom()
        XCTAssert(random == 1 || random == 2)
        // Removes 1 from the set, returns true. Set now contains [2].
        XCTAssertEqual(randomSet.remove(1), true)
        // 2 was already in the set, so return false.
        XCTAssertEqual(randomSet.insert(2), false)
        // Since 2 is the only number in the set, getRandom always return 2.
        XCTAssertEqual(randomSet.getRandom(),2)
    }
    
}

SolutionTests.defaultTestSuite.run()
