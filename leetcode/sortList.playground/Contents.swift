import Foundation
import XCTest

/*
 Sort List

 Given the head of a linked list, return the list after sorting it in ascending order.

 Can you sort the linked list in O(n logn) time and O(1) memory
 
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
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var head = head
        var list = [Int]()
        while head != nil {
            list.append(head!.val)
            head = head!.next
        }
        list.sort()
        let output = ListNode(list[0])
        head = output
        for i in 1..<list.count {
            head!.next = ListNode(list[i])
            head = head!.next!
        }
        return output
    }
}


class Solution2 {
    func sortList(_ head: ListNode?) -> ListNode? {
        sortListQuickSort(head, -1)
        return head
    }
    
    private func sortListQuickSort(_ head: ListNode?,_ level: Int) {
        if head == nil || head?.next == nil || level == 0 { return }
        let pivote = head!.val
        var i: ListNode? = head
        var j: ListNode? = head?.next
        var countI = 0, countJ = 0
        while j != nil {
            if j!.val < pivote {
                i = i!.next
                countI += 1
                swap(j!, i!)
            }
            j = j!.next
            countJ += 1
            if level > 0 && countJ >= level-1  { break }
        }
        swap(head!, i!)
        sortListQuickSort(head, countI)
        sortListQuickSort(i?.next, countJ - countI)
    }
    
    private func swap(_ l1: ListNode, _ l2: ListNode) {
        let tmp = l1.val
        l1.val = l2.val
        l2.val = tmp
    }
    
}

class Solution3 {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        let mid = middle(ofList: head)
        let leftList: ListNode? = sortList(head)
        let rightList: ListNode? = sortList(mid)

        return merge(leftList, rightList)
    }

    func merge(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
        var head1 = head1, head2 = head2
        let dummyHead = ListNode()
        var tail: ListNode? = dummyHead

        while head1 != nil && head2 != nil {
            if head1!.val < head2!.val {
                tail!.next = head1
                tail = head1
                head1 = head1!.next
            } else {
                tail!.next = head2
                tail = head2
                head2 = head2!.next
            }
        }

        tail!.next = head1 == nil ? head2 : head1

        return dummyHead.next
    }

    func middle(ofList head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }

        var slow: ListNode? = head
        var fast: ListNode? = head

        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        let res = slow?.next
        slow?.next = nil

        return res
    }
}

class SolutionTests: XCTestCase {
    
    var solution = Solution()
    
    func testExampleOne() {
        let unsortedList = ListNode(4, ListNode(2, ListNode(1, ListNode(3))))
        XCTAssertEqual(solution.sortList(unsortedList), ListNode(1, ListNode(2, ListNode(3, ListNode(4)))))
    }
    
}

SolutionTests.defaultTestSuite.run()

