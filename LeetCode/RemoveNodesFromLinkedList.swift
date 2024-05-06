//
//  RemoveNodesFromLinkedList.swift
//  https://leetcode.com/problems/remove-nodes-from-linked-list/
//
//  Created by Erik Radicheski da Silva on 06/05/24.
//

import XCTest

final class RemoveNodesFromLinkedList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let head = ListNode.createLinkedList([5, 2, 13, 3, 8])
        let expectedOutput = ListNode.createLinkedList([13, 8])
        XCTAssertEqual(solution.removeNodes(head), expectedOutput)
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([1, 1, 1, 1])
        let expectedOutput = ListNode.createLinkedList([1, 1, 1, 1])
        XCTAssertEqual(solution.removeNodes(head), expectedOutput)
    }
    
}

private class Solution {
    func removeNodes(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var list = [head]
        
        while let node = list.last?.next {
            list.append(node)
        }
        
        var maximum = Int.min
        
        for i in list.indices.reversed() {
            if list[i].val < maximum {
                list.remove(at: i)
            } else {
                maximum = max(maximum, list[i].val)
            }
        }
        
        for (i, node) in list.enumerated() {
            if list.indices.contains(i + 1) {
                node.next = list[i + 1]
            } else {
                node.next = nil
            }
        }
        
        return list[0]
    }
}
