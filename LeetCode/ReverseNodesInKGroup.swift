//
//  ReverseNodesInKGroup.swift
//  https://leetcode.com/problems/reverse-nodes-in-k-group/
//
//  Created by Erik Radicheski da Silva on 10/10/22.
//

import XCTest

final class ReverseNodesInKGroup: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let output = solution.reverseKGroup(input, 2)
        let expectedOutput = ListNode.createLinkedList([2, 1, 4, 3, 5])
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let output = solution.reverseKGroup(input, 3)
        let expectedOutput = ListNode.createLinkedList([3, 2, 1, 4, 5])
        XCTAssertEqual(expectedOutput, output)
    }

}

private class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return head }
        
        var node = head
        
        var list = [ListNode?]()
        
        while node != nil {
            list.append(node)
            node = node?.next
        }
        
        let lastGroupIndex = list.count / k
        
        for index in 0 ..< lastGroupIndex {
            var subrange = [ListNode?]()
            
            for _ in 0 ..< k {
                subrange.append(list.remove(at: index * k))
            }
            
            list.insert(contentsOf: subrange.reversed(), at: index * k)
        }
        
        for (index, element) in list.enumerated() {
            if index + 1 == list.count {
                element?.next = nil
                break
            }
            
            element?.next = list[index + 1]
        }
        
        return list.first ?? nil
    }
}
