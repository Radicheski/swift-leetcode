//
//  InsertGreatestCommonDivisorsInLinkedList.swift
//  https://leetcode.com/problems/insert-greatest-common-divisors-in-linked-list/
//
//  Created by Erik Radicheski da Silva on 10/09/24.
//

import XCTest

final class InsertGreatestCommonDivisorsInLinkedList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let head = ListNode.createLinkedList([18, 6, 10, 3])
        let answer = ListNode.createLinkedList([18, 6, 6, 2, 10, 1, 3])
        XCTAssertEqual(solution.insertGreatestCommonDivisors(head), answer)
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([7])
        let answer = ListNode.createLinkedList([7])
        XCTAssertEqual(solution.insertGreatestCommonDivisors(head), answer)
    }
    
}

private class Solution {
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        var (node, next) = (head, head?.next)
        
        while let currentNode = node, let nextNode = next {
            let newNode = ListNode(gcd(currentNode.val, nextNode.val))
            node?.next = newNode
            newNode.next = next
            
            node = next
            next = next?.next
        }
        
        return head
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var (a, b) = (a, b)
        
        while b != 0 {
            let t = b
            b = a % b
            a = t
        }
        
        return a
    }
}
