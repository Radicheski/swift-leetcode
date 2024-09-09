//
//  SpiralMatrix4.swift
//  https://leetcode.com/problems/spiral-matrix-iv/
//
//  Created by Erik Radicheski da Silva on 09/09/24.
//

import XCTest

final class SpiralMatrix4: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let head = ListNode.createLinkedList([3, 0, 2, 6, 8, 1, 7, 9, 4, 2, 5, 5, 0])
        XCTAssertEqual(solution.spiralMatrix(3, 5, head), [[3, 0, 2, 6, 8],
                                                           [5, 0, -1, -1, 1],
                                                           [5, 2, 4, 9, 7]])
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([0, 1, 2])
        XCTAssertEqual(solution.spiralMatrix(1, 4, head), [[0, 1, 2, -1]])
    }
    
}

private class Solution {
    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var answer = Array(repeating: Array(repeating: -1, count: n), count: m)
        var (i, j) = (0, 0)
        var (di, dj) = (0, 1)
        
        var node = head
        
        while let current = node {
            answer[i][j] = current.val
            node = current.next
            
            if answer.indices.contains(i + di) == false
                || answer[i + di].indices.contains(j + dj) == false
                || answer[i + di][j + dj] != -1 {
                (di, dj) = (dj, -di)
            }
            
            (i, j) = (i + di, j + dj)
        }
        
        return answer
    }
}
