//
//  AddTwoNumbers.swift
//  https://leetcode.com/problems/add-two-numbers/
//
//  Created by Erik Radicheski da Silva on 07/10/22.
//

import XCTest

final class AddTwoNumbers: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let l1 = ListNode.createLinkedList([2, 4, 3])
        let l2 = ListNode.createLinkedList([5, 6, 4])
        let output = ListNode.createLinkedList([7, 0, 8])
        XCTAssertEqual(solution.addTwoNumbers(l1, l2), output)
    }
    
    func testExampleB() {
        let l1 = ListNode.createLinkedList([0])
        let l2 = ListNode.createLinkedList([0])
        let output = ListNode.createLinkedList([0])
        XCTAssertEqual(solution.addTwoNumbers(l1, l2), output)
    }
    
    func testExampleC() {
        let l1 = ListNode.createLinkedList([9, 9, 9, 9, 9, 9, 9])
        let l2 = ListNode.createLinkedList([9, 9, 9, 9])
        let output = ListNode.createLinkedList([8, 9, 9, 9, 0, 0, 0, 1])
        XCTAssertEqual(solution.addTwoNumbers(l1, l2), output)
    }

}

private class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        
        var l1 = l1
        var l2 = l2
        
        var list = [Int]()
        
        while l1 != nil || l2 != nil {
            let v1 = l1?.val ?? 0
            let v2 = l2?.val ?? 0
            list.append(v1 + v2)
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        for index in 0 ..< list.count {
            if list[index] > 9 {
                if index + 1 >= list.count {
                    list.append(list[index] / 10)
                } else {
                    list[index + 1] += list[index] / 10
                }
                list[index] %= 10
            }
        }
        
        return createList(list)
        
    }
    
    private func createList(_ array: [Int]) -> ListNode? {
        var head: ListNode?
        
        for number in array.reversed() {
            head = ListNode(number, head)
        }
        
        return head
    }
}
