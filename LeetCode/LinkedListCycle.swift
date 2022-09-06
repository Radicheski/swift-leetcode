//
//  LinkedListCycle.swift
//  https://leetcode.com/problems/linked-list-cycle/
//
//  Created by Erik Radicheski da Silva on 06/09/22.
//

import XCTest

class LinkedListCycle: XCTestCase {

    func test() {
        let solution = Solution()
        
//        XCTAssertTrue(solution.hasCycle([3, 2, 0, -4]))
//        XCTAssertTrue(solution.hasCycle([1, 2]))
//        XCTAssertTrue(solution.hasCycle([1]))
    }

}

private class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        
        var node = head
        var nodeArray = [ListNode?]()
        
        while node != nil {
            if nodeArray.contains(where: { $0 === node } ) { return true }
            nodeArray.append(node)
            node = node?.next
        }
        
        return false
    }
}
