//
//  LinkedListCycle2.swift
//  https://leetcode.com/problems/linked-list-cycle-ii/submissions/
//
//  Created by Erik Radicheski da Silva on 19/08/22.
//

import XCTest

class LinkedListCycle2: XCTestCase {

    func test() {
        let solution = Solution()
        
        var input: (head: ListNode?, cycle: ListNode?)
        
        input = createTestCase([3, 2, 0, -4], 1)
        XCTAssert(solution.detectCycle(input.head) === input.cycle)
        
        input = createTestCase([1, 2], 0)
        XCTAssert(solution.detectCycle(input.head) === input.cycle)
        
        input = createTestCase([1], -1)
        XCTAssert(solution.detectCycle(input.head) === input.cycle)
    }
    
    private func createTestCase(_ array: [Int], _ pos: Int) -> (head: ListNode?, cycle: ListNode?) {
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

private class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        
        var node = head
        var nodeArray = [ListNode?]()
        
        while node != nil {
            if nodeArray.contains(where: { $0 === node } ) { return node }
            nodeArray.append(node)
            node = node?.next
        }
        
        return nil
    }
}
