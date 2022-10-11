//
//  ReorderList.swift
//  https://leetcode.com/problems/reorder-list/
//
//  Created by Erik Radicheski da Silva on 10/10/22.
//

import XCTest

final class ReorderList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 4])
        solution.reorderList(input)
        let expectedOutput = ListNode.createLinkedList([1, 4, 2, 3])
        XCTAssertEqual(expectedOutput, input)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        solution.reorderList(input)
        let expectedOutput = ListNode.createLinkedList([1, 5, 2, 4, 3])
        XCTAssertEqual(expectedOutput, input)
    }

}

private class Solution {
    func reorderList(_ head: ListNode?) {
        var list = [ListNode?]()
        
        var node = head
        
        while node != nil {
            list.append(node)
            node = node?.next
        }
        
        var index = 1
        let lastIndex = list.endIndex
        
        while index < lastIndex {
            node = list.removeLast()
            list.insert(node, at: index)
            index += 2
        }
        
        for (index, element) in list.enumerated() {
            if index + 1 == list.count {
                element?.next = nil
                break
            }
            
            element?.next = list[index + 1]
        }
    }
}
