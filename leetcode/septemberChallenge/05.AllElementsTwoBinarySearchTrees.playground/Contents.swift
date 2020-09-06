import Foundation
import XCTest

/*
 All Elements in Two Binary Search Trees
 
 Given two binary search trees root1 and root2.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        let result = getAllElements(root1) + getAllElements(root2)
        return result.sorted()
    }
    
    private func getAllElements(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()
        result.append(root.val)
        if let left = root.left {
            result.append(contentsOf: getAllElements(left))
        }
        if let right = root.right {
            result.append(contentsOf: getAllElements(right))
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        let roor1 = TreeNode(2, TreeNode(1), TreeNode(4))
        let roor2 = TreeNode(1, TreeNode(0), TreeNode(3))
        XCTAssertEqual(solution.getAllElements(roor1, roor2), [0,1,1,2,3,4])
    }
    
}

SolutionTests.defaultTestSuite.run()

