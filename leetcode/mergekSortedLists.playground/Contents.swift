import Foundation
import XCTest

/*
 Merge k Sorted Lists
 
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
 
 Merge all the linked-lists into one sorted linked-list and return it.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(val) -> \(next?.description ?? "final")"
    }
}

class Solution {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else { return lists.first ?? nil }
        let mid = lists.count>>1
        let listA = mergeKLists(Array(lists[0..<mid]))
        let listB = mergeKLists(Array(lists[mid..<lists.count]))
        return mergeTwoLists(listA, listB)
    }
    
    private func mergeTwoLists(_ listA: ListNode?, _ listB: ListNode?) -> ListNode? {
        guard let headA = listA else { return listB }
        guard let headB = listB else { return listA }
        if headA.val > headB.val {
            headB.next = mergeTwoLists(listA, headB.next)
            return headB
        }
        headA.next = mergeTwoLists(listA?.next, listB)
        return headA
    }
    
}

class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testExampleOne() {
        let nodes = [
            ListNode(1, ListNode(4, ListNode(5))),
            ListNode(1, ListNode(3, ListNode(4))),
            ListNode(2, ListNode(6))
        ]
        XCTAssertEqual(solution.mergeKLists(nodes), ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4, ListNode(5, ListNode(6)))))))))
    }
    
}

SolutionTests.defaultTestSuite.run()
