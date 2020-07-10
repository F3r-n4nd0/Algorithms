import Foundation
import XCTest

/*
 Flatten a Multilevel Doubly Linked List
 
 You are given a doubly linked list which in addition to the next and previous pointers, it could have a child pointer, which may or may not point to a separate doubly linked list. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure, as shown in the example below.
 
 Flatten the list so that all the nodes appear in a single-level, doubly linked list. You are given the head of the first level of the list.
 
 */

public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}

class Solution {
    
    func flatten(_ head: Node?) -> Node? {
        var queue = [Node] ()
        flatten(head, &queue)
        return head
    }
    
    private func flatten(_ head: Node?,_ queue: inout [Node]) {
        guard let head = head else { return }
        if let child = head.child {
            if let next = head.next { queue.append(next) }
            head.child = nil
            head.next = child
            child.prev = head
        }
        if head.next == nil && queue.count > 0 {
            let last = queue.popLast()
            head.next = last
            last?.prev = head
        }
        flatten(head.next, &queue)
    }
    
}


class Solution2 {
    
    func flatten(_ head: Node?) -> Node? {
        var node: Node? = head
        while node != nil {
            guard var child = node?.child else {
                node = node?.next
                continue
            }
            while child.next != nil {
                child = child.next!
            }
            child.next = node?.next
            if node?.next != nil { node?.next!.prev = child }
            node?.next = node?.child
            node?.child?.prev = node
            node?.child = nil
        }
        return head
    }
    
}



let root = Node(1)
root.next = Node(2)
root.child = Node(3)

var test = Solution2().flatten(root)

while test != nil {
    print(test?.val ?? "null")
    test = test?.next
}
