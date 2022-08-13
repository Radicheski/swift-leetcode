//
//  ListNode.swift
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

    static func createLinkedList(_ array: [Int]) -> ListNode? {
        var head: ListNode?

        for number in array.reversed() {
            head = ListNode(number, head)
        }

        return head
    }
}

extension ListNode: Equatable {

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }

}
