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

extension ListNode {
    
    public static func createTestCase(_ array: [Int], _ pos: Int) -> (head: ListNode?, cycle: ListNode?) {
        var head, previous, current, cycle: ListNode?
        
        for index in 0..<array.count{
            current = ListNode(array[index])
            
            if index == 0 { head = current }
            if index == pos { cycle = current }
            
            previous?.next = current
            previous = current
        }
        
        current?.next = cycle
        
        return (head, cycle)
    }
    
}
