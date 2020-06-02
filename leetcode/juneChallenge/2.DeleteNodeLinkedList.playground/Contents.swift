import Foundation

/*
 Delete Node in a Linked List
 
 Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    
    func deleteCurrentNode() {
        guard let next = next else {
            return
        }
        self.val = next.val
        self.next = next.next
    }
    
}

class Solution {
    func deleteNode(_ node: ListNode?) {
        node?.deleteCurrentNode()
    }
}

// Test

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

extension ListNode {
    
    func detail() -> String {
        return "\(val) -> \(next?.detail() ?? "end")"
    }
    
}

Solution().deleteNode(node3)
print(node1.detail())

