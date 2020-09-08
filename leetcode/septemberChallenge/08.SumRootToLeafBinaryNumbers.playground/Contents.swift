import Foundation
import XCTest

/*
 Sum of Root To Leaf Binary Numbers
 
 Given a binary tree, each node has value 0 or 1.  Each root-to-leaf path represents a binary number starting with the most significant bit.  For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.

 For all leaves in the tree, consider the numbers represented by the path from the root to that leaf.

 Return the sum of these numbers.
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
    
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        return sumRootToLeaf(root, [])
    }
    
    private func sumRootToLeaf(_ root: TreeNode?,_ last: [Int]) -> Int {
        guard let root = root else { return 0 }
        if root.right == nil && root.left == nil {
            return calculateBites([root.val] + last)
        }
        return sumRootToLeaf(root.right, [root.val] + last) + sumRootToLeaf(root.left, [root.val] + last)
    }
    
    private func calculateBites(_ bites: [Int]) -> Int {
        var multiplier = 1, sum = 0
        for i in 0..<bites.count {
            if bites[i] == 1 { sum += multiplier }
            multiplier *= 2
        }
        return sum
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        let root = TreeNode(1, TreeNode(0, TreeNode(0), TreeNode(1)), TreeNode(1, TreeNode(0), TreeNode(1)))
        XCTAssertEqual(solution.sumRootToLeaf(root), 22)
    }
    func testExampleTwo() {
        let root = TreeNode(1, TreeNode(1), nil)
        XCTAssertEqual(solution.sumRootToLeaf(root), 3)
    }
    
}

SolutionTests.defaultTestSuite.run()

