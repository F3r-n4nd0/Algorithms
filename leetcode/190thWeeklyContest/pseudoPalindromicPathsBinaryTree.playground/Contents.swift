import Foundation


/*
 Given a binary tree where node values are digits from 1 to 9. A path in the binary tree is said to be pseudo-palindromic if at least one permutation of the node values in the path is a palindrome.

 Return the number of pseudo-palindromic paths going from the root node to leaf nodes.
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
    
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        return calculateTree(root: root, set: Set())
    }
    
    func calculateTree(root: TreeNode?,set: Set<Int>) -> Int {
        guard let root = root else { return 0 }
        var newSet = set
        if set.contains(root.val) {
            newSet.remove(root.val)
        } else {
            newSet.insert(root.val)
        }
        switch (root.left, root.right) {
        case (let left?, let right?):
            return calculateTree(root: left, set: newSet) + calculateTree(root: right, set: newSet)
        case (let left?, nil):
            return calculateTree(root: left, set: newSet)
        case (nil, let right?):
            return calculateTree(root: right, set: newSet)
        case (nil, nil):
            return newSet.count <= 1 ? 1 : 0
        }
    }
    
}
