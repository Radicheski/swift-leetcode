//
//  RemoveLinkedListElements.swift
//  https://leetcode.com/problems/remove-linked-list-elements/
//
//  Created by Erik Radicheski da Silva on 06/09/22.
//

import XCTest

class RemoveLinkedListElements: XCTestCase {

    func test() {
        
    }

}

private class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        var currentNode = head
        var previousNode: ListNode?
        var newHead = head?.val == val ? nil : head;
        
        while currentNode != nil {
            if currentNode?.val == val {
                previousNode?.next = currentNode?.next
                currentNode = currentNode?.next
                continue
            }
            if newHead == nil && currentNode?.val != val {
                newHead = currentNode
            }
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        return newHead
    }
}
