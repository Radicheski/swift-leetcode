//
//  IntersectionOfTwoLinkedLists.swift
//  https://leetcode.com/problems/intersection-of-two-linked-lists/
//
//  Created by Erik Radicheski da Silva on 08/10/22.
//

import XCTest

final class IntersectionOfTwoLinkedLists: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let (listA, listB, intersection) = createTestCases([4, 1], [5, 6, 1], [8, 4, 5])
        XCTAssertEqual(solution.getIntersectionNode(listA, listB), intersection)
    }
    
    func testExampleB() {
        let (listA, listB, intersection) = createTestCases([1, 9, 1], [3], [2, 4])
        XCTAssertEqual(solution.getIntersectionNode(listA, listB), intersection)
    }
    
    func testExampleC() {
        let (listA, listB, intersection) = createTestCases([2, 6, 4], [1, 5], [])
        XCTAssertEqual(solution.getIntersectionNode(listA, listB), intersection)
    }
    
    private func createTestCases(_ listA: [Int], _ listB: [Int], _ commonList: [Int]) -> (ListNode?, ListNode?, ListNode?) {
        var commonHead: ListNode? = nil
        
        for i in stride(from: commonList.count - 1, to: -1, by: -1) {
            let listNode = ListNode(commonList[i], commonHead)
            commonHead = listNode
        }
        
        var bHead: ListNode? = nil
        
        for i in stride(from: listB.count - 1, to: -1, by: -1) {
            let listNode = ListNode(listB[i], i == listB.count - 1 ? commonHead : bHead)
            bHead = listNode
        }
        
        var aHead: ListNode? = nil
        
        for i in stride(from: listA.count - 1, to: -1, by: -1) {
            let listNode = ListNode(listA[i], i == listA.count - 1 ? commonHead : aHead)
            aHead = listNode
        }
        
        return (aHead, bHead, commonHead)
    }
}

private class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var arrayA = [ListNode?]()
        
        var nextA = headA
        
        while nextA != nil {
            arrayA.append(nextA)
            nextA = nextA?.next
        }
        
        var nextB = headB
        
        while nextB != nil {
            if arrayA.contains(where: { $0 === nextB } ) {
                return nextB
            }
            nextB = nextB?.next
        }
        
        return nil
    }
}
