//
//  FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints.swift
//  https://leetcode.com/problems/find-the-minimum-and-maximum-number-of-nodes-between-critical-points/
//
//  Created by Erik Radicheski da Silva on 05/07/24.
//

import XCTest

final class FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = ListNode.createLinkedList([3, 1])
        XCTAssertEqual(solution.nodesBetweenCriticalPoints(root), [-1, -1])
    }
    
    func testExampleB() {
        let root = ListNode.createLinkedList([5, 3, 1, 2, 5, 1, 2])
        XCTAssertEqual(solution.nodesBetweenCriticalPoints(root), [1, 3])
    }
    
    func testExampleC() {
        let root = ListNode.createLinkedList([1, 3, 2, 2, 3, 2, 2, 2, 7])
        XCTAssertEqual(solution.nodesBetweenCriticalPoints(root), [3, 3])
    }
    
}

private class Solution {
    func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
        var values = [Int]()
        
        var node = head
        while node != nil {
            values.append(node!.val)
            node = node?.next
        }
        
        var criticalPoints = [Int]()
        
        for i in 1 ..< values.endIndex - 1 {
            if (values[i - 1] > values[i] && values[i] < values[i + 1]) ||
                (values[i - 1] < values[i] && values[i] > values[i + 1]) {
                criticalPoints.append(i)
            }
        }
        
        guard criticalPoints.count > 1 else { return [-1, -1] }
        
        var minimum = Int.max
        var maximum = criticalPoints.last! - criticalPoints.first!
        
        for i in 1 ..< criticalPoints.endIndex {
            minimum = min(minimum, criticalPoints[i] - criticalPoints[i - 1])
        }
        
        return [minimum, maximum]
    }
}
