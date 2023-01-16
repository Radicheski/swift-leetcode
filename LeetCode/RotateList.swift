//
//  RotateList.swift
//  https://leetcode.com/problems/rotate-list/
//
//  Created by Erik Radicheski da Silva on 16/01/23.
//

import XCTest

final class RotateList: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let expectedOutput = ListNode.createLinkedList([4, 5, 1, 2, 3])
        XCTAssertEqual(solution.rotateRight(input, 2), expectedOutput)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([0, 1, 2])
        let expectedOutput = ListNode.createLinkedList([2, 0, 1])
        XCTAssertEqual(solution.rotateRight(input, 4), expectedOutput)
    }

}

private class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        
        var array = [head]
        
        while let nextNode = array.last?.next {
            array.append(nextNode)
        }
        
        let k = k % array.count
        
        guard k > 0 else { return head }
        
        for _ in 0 ..< k {
            let node = array.removeLast()
            node.next = array[0]
            array.insert(node, at: 0)
        }
        
        array.last?.next = nil
        
        return array.first
    }
}
