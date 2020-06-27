import Foundation
import XCTest

/*
 Sum Root to Leaf Numbers
 
 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
 
 An example is the root-to-leaf path 1->2->3 which represents the number 123.
 
 Find the total sum of all root-to-leaf numbers.
 
 Note: A leaf is a node with no children.
 
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        let sum = getNumbers(root)
        return sum.reduce(into: 0) { $0 += Int($1)! }
    }
    
    func getNumbers(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        let currentVal  = root.val
        if root.left == nil && root.right == nil {
            return [String(currentVal)]
        }
        var response = [String]()
        if let left = root.left  {
            response.append(contentsOf: getNumbers(left))
        }
        if let right = root.right  {
            response.append(contentsOf: getNumbers(right))
        }
        for i in 0..<response.count {
            response[i] = String(currentVal) + response[i]
        }
        return response
    }
    
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExampleOne() {
        XCTAssertEqual(solution.sumNumbers(TreeNode(4, TreeNode(9,TreeNode(5),TreeNode(1)), TreeNode(0))), 1026)
        XCTAssertEqual(solution.sumNumbers(TreeNode(1, TreeNode(2), TreeNode(3))), 25)
    }
    
}

SolutionTests.defaultTestSuite.run()

