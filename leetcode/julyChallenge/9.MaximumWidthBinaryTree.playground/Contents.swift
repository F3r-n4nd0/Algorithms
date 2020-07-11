import Foundation
import XCTest

/*
 Maximum Width of Binary Tree
 
 Given a binary tree, write a function to get the maximum width of the given tree. The width of a tree is the maximum width among all levels. The binary tree has the same structure as a full binary tree, but some nodes are null.
 
 The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.
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
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [(TreeNode, Int)]()
        queue.append((root, 0))
        var result = 1
        while queue.count  > 0 {
            let count = queue.count
            let firstNode = queue.first!
            let lastNode = queue.last!
            result = max(result, lastNode.1 - firstNode.1 + 1)
            for _ in 0..<count {
                let (node, val) = queue.removeFirst()
                if let leftNode = node.left {
                    queue.append((leftNode, val * 2 - 1))
                }
                if let rightNode = node.right {
                    queue.append((rightNode, val * 2))
                }
            }
        }
        
        return result
    }
}

class Solution2 {
    
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var results = [[Int]]()
        helper(root, 1, 0, &results)
        var max = 0
        for result in results {
            let levelResult = (result.max() ?? 0) - (result.min() ?? 0) + 1
            max = Swift.max(levelResult, max)
        }
        return max
    }
    
    private func helper(_ root: TreeNode?,_ depth: Int,_ seed: Int,_ result: inout [[Int]]){
        guard let root = root else { return }
        if result.count < depth {
            result.append([])
        }
        result[depth-1].append(seed)
        helper(root.left, depth+1, (2*seed)+1, &result)
        helper(root.right, depth+1, (2*seed), &result)
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution = Solution2()
    
    func testExampleOne() {
        XCTAssertEqual(solution.widthOfBinaryTree(TreeNode(1,
                                                           TreeNode(1,
                                                                    TreeNode(1,TreeNode(1),TreeNode(1)),TreeNode(1,TreeNode(1),TreeNode(1))),
                                                           TreeNode(1,
                                                                    TreeNode(1,TreeNode(1),TreeNode(1)),TreeNode(1,TreeNode(1),TreeNode(1))))), 8)
    }
    
    func testExampleTwo() {
        XCTAssertEqual(solution.widthOfBinaryTree(TreeNode(1,
                                                           TreeNode(3,
                                                                    TreeNode(5),TreeNode(3)),
                                                           nil)), 2)
    }
    
    func testExampleThree() {
        XCTAssertEqual(solution.widthOfBinaryTree(TreeNode(1,
                                                           TreeNode(1,
                                                                    TreeNode(1,
                                                                             TreeNode(1),
                                                                             nil),
                                                                    nil),
                                                           TreeNode(1,
                                                                    nil,
                                                                    TreeNode(1,
                                                                             nil,
                                                                             TreeNode(1)
                                                                    )
                                                           ))
        ), 8)
    }
}

SolutionTests.defaultTestSuite.run()

