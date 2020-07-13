import Foundation
import XCTest

/*
 Same Tree
 
 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
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
 
extension TreeNode: Equatable {
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
    
}

class Solution {
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return p == q
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        let root = TreeNode(1,TreeNode(2),TreeNode(3))
        XCTAssertEqual(solution.isSameTree(root, root), true)
    }
    
    func testExampleTwo() {
        let root = TreeNode(1,TreeNode(2),TreeNode(3))
        XCTAssertEqual(solution.isSameTree(root, nil), false)
    }
    
    func testExampleThree() {
        let one = TreeNode(1,TreeNode(2),TreeNode(3,nil,TreeNode(4)))
        let two = TreeNode(1,TreeNode(3,TreeNode(4),TreeNode(5)), nil)
        XCTAssertEqual(solution.isSameTree(one, two), false)
    }
    
}

SolutionTests.defaultTestSuite.run()

