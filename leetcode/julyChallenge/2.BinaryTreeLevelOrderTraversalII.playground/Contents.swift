import Foundation
import XCTest

/*
 Binary Tree Level Order Traversal II
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
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
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
         var res = levelOrder(root)
         res.reverse()
         return res
     }
     
     private func levelOrder(_ node: TreeNode?) -> [[Int]] {
         guard let node = node else {
             return []
         }
         let left = levelOrder(node.left)
         let right = levelOrder(node.right)
         var result = [[Int]]()
         result.append([node.val])
         for i in 0..<Swift.max(left.count, right.count) {
             let l = i < left.count  ? left[i] : []
             let r = i < right.count  ? right[i] : []
             result.append(l+r)
         }
         return result
     }
    
}

class Solution2 {
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        var bases = [root]
        while bases.count > 0 {
            result.insert(bases.map({$0.val}), at: 0)
            let count = bases.count
            for base in bases {
                if let left = base.left { bases.append(left) }
                if let right = base.right { bases.append(right) }
            }
            bases.removeFirst(count)
            
        }
        return result
     }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution2!
    
    override func setUp() {
        super.setUp()
        solution = Solution2()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.levelOrderBottom(TreeNode(3,TreeNode(9),TreeNode(20,TreeNode(15),TreeNode(7)))), [
            [15,7],
            [9,20],
            [3]
          ])
    }
    
}

SolutionTests.defaultTestSuite.run()

