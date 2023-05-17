//
//  MaximumTwinSumOfALinkedList.swift
//  https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list/
//
//  Created by Erik Radicheski da Silva on 17/05/23.
//

import XCTest

final class MaximumTwinSumOfALinkedList: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let head = ListNode.createLinkedList([5, 4, 2, 1])
        XCTAssertEqual(solution.pairSum(head), 6)
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([4, 2, 2, 3])
        XCTAssertEqual(solution.pairSum(head), 7)
    }
    
    func testExampleC() {
        let head = ListNode.createLinkedList([1, 100000])
        XCTAssertEqual(solution.pairSum(head), 100001)
    }

}

private class Solution {
    func pairSum(_ head: ListNode?) -> Int {
        var map = [Int: Int]()
        var maxSum = Int.min
        var n = Int.max
        
        var index = 0
        var node = head
        var fastNode = head?.next
        
        while node != nil {
            guard let nodeVal = node?.val else { fatalError() }
            
            if fastNode == nil {
                if n == .max { n = 2 * index }
                
                let twinIndex = n - index - 1
                guard let twinVal = map[twinIndex] else { fatalError() }
                
                let twinSum = twinVal + nodeVal
                maxSum = max(maxSum, twinSum)
            } else {
                map[index] = nodeVal
            }
            
            node = node?.next
            fastNode = fastNode?.next?.next
            
            index += 1
        }
        
        return maxSum
    }
}
