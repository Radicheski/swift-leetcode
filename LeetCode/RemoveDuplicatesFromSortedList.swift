//
//  RemoveDuplicatesFromSortedList.swift
//  https://leetcode.com/problems/remove-duplicates-from-sorted-list/
//
//  Created by Erik Radicheski da Silva on 07/09/22.
//

import XCTest

class RemoveDuplicatesFromSortedList: XCTestCase {

    func test() {
        
    }

}

private class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        
        while let nextNode = node?.next {
            if node?.val == nextNode.val {
                node?.next = nextNode.next
                continue
            }
            node = nextNode
        }
        
        return head
    }
}
