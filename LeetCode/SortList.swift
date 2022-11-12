//
//  SortList.swift
//  https://leetcode.com/problems/sort-list/
//
//  Created by Erik Radicheski da Silva on 12/11/22.
//

import XCTest

final class SortList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA(){
        let input = ListNode.createLinkedList([4, 2, 1, 3])
        let expectedOutput = ListNode.createLinkedList([1, 2, 3, 4])
        let output = solution.sortList(input)
        XCTAssertTrue(ListNode.isEqual(expectedOutput, output))
    }
    
    func testExampleB(){
        let input = ListNode.createLinkedList([-1, 5, 3, 4, 0])
        let expectedOutput = ListNode.createLinkedList([-1, 0, 3, 4, 5])
        let output = solution.sortList(input)
        XCTAssertTrue(ListNode.isEqual(expectedOutput, output))
    }
    
    func testExampleC(){
        let input = ListNode.createLinkedList([])
        let expectedOutput = ListNode.createLinkedList([])
        let output = solution.sortList(input)
        XCTAssertTrue(ListNode.isEqual(expectedOutput, output))
    }

}

private class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        
        let (firstHalf, lastHalf) = splitList(head)
        
        if lastHalf == nil { return firstHalf }
        
        var sortedFirstHalf = sortList(firstHalf)
        var sortedLastHalf = sortList(lastHalf)
        
        var newHead: ListNode?
        
        if let firstVal = sortedFirstHalf?.val,
           let lastVal = sortedLastHalf?.val,
           firstVal < lastVal {
            newHead = sortedFirstHalf
            sortedFirstHalf = sortedFirstHalf?.next
        } else {
            newHead = sortedLastHalf
            sortedLastHalf = sortedLastHalf?.next
        }
        
        var lastNode = newHead
        
        while sortedFirstHalf != nil || sortedLastHalf != nil {
            guard let firstVal = sortedFirstHalf?.val else {
                lastNode?.next = sortedLastHalf
                sortedLastHalf = sortedLastHalf?.next
                lastNode = lastNode?.next
                continue
            }
            
            guard let lastVal = sortedLastHalf?.val else {
                lastNode?.next = sortedFirstHalf
                sortedFirstHalf = sortedFirstHalf?.next
                lastNode = lastNode?.next
                continue
            }
            
            if firstVal < lastVal {
                lastNode?.next = sortedFirstHalf
                sortedFirstHalf = sortedFirstHalf?.next
            } else {
                lastNode?.next = sortedLastHalf
                sortedLastHalf = sortedLastHalf?.next
            }
            
            lastNode = lastNode?.next
        }
        
        return newHead
    }
    
    private func splitList(_ head: ListNode?) -> (first: ListNode?, last: ListNode?) {
        guard let firstHalf = head else { return (nil, nil) }
        let lastHalf = findMiddle(head)
        
        if lastHalf === firstHalf { return (firstHalf, nil) }
        
        var next: ListNode? = firstHalf
        while next != nil {
            if next?.next === lastHalf {
                next?.next = nil
            }
            next = next?.next
        }
        
        return (firstHalf, lastHalf)
    }
    
    private func findMiddle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var middle = head
        var next = head?.next
        var counter = 0
        
        while next != nil {
            counter += 1
            if counter.isMultiple(of: 2) == false {
                middle = middle?.next
            }
            next = next?.next
        }
        
        return middle
    }
}
