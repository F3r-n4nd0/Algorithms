import Foundation
import XCTest

/*
 Count Complete Tree Nodes
 
 Given a complete binary tree, count the number of nodes.

 Note:

 Definition of a complete binary tree from Wikipedia:
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
 
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
    
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return countNodes(root!.left) + countNodes(root!.right) + 1
    }
    
}

