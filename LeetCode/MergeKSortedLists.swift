//
//  MergeKSortedLists.swift
//  https://leetcode.com/problems/merge-k-sorted-lists/
//
//  Created by Erik Radicheski da Silva on 12/03/23.
//

import XCTest

final class MergeKSortedLists: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = [[1, 4, 5], [1, 3, 4], [2, 6]].map(ListNode.createLinkedList)
        let output = ListNode.createLinkedList([1, 1, 2, 3, 4, 4, 5, 6])
        XCTAssertTrue(ListNode.isEqual(solution.mergeKLists(input), output))
    }
    
    func testExampleB() {
        let input = [].map(ListNode.createLinkedList)
        let output = ListNode.createLinkedList([])
        XCTAssertTrue(ListNode.isEqual(solution.mergeKLists(input), output))
    }
    
    func testExampleC() {
        let input = [[]].map(ListNode.createLinkedList)
        let output = ListNode.createLinkedList([])
        XCTAssertTrue(ListNode.isEqual(solution.mergeKLists(input), output))
    }

}

private class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var nodes = [Int: [ListNode?]]()
        
        for list in lists {
            var node = list
            
            while node != nil {
                nodes[node!.val, default: []].append(node)
                node = node?.next
            }
        }
        
        guard nodes.isEmpty == false else { return nil }
        
        let array: [ListNode?] = nodes.sorted(by: { $0.key < $1.key } )
            .reduce(into: []) { $0.append(contentsOf: $1.value) }
        
        for i in 0 ..< array.endIndex - 1 {
            array[i]?.next = array[i + 1]
        }
        
        array[array.endIndex - 1]?.next = nil
        
        return array[0]
    }
}
