//
//  KthSmallestInLexicographicalOrder.swift
//  https://leetcode.com/problems/k-th-smallest-in-lexicographical-order/
//
//  Created by Erik Radicheski da Silva on 22/09/24.
//

import XCTest

final class KthSmallestInLexicographicalOrder: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findKthNumber(13, 2), 10)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findKthNumber(1, 1), 1)
    }
    
}

private class Solution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        var current = 1
        var k = k - 1
        
        while k > 0 {
            var steps = depthFirst(n, current, current + 1)
            
            if steps <= k {
                current += 1
                k -= steps
            } else {
                current *= 10
                k -= 1
            }
        }
        
        return current
    }
    
    private func depthFirst(_ n: Int, _ start: Int, _ end: Int) -> Int {
        var steps = 0
        var (start, end) = (start, end)
        
        while start <= n {
            steps += min(n + 1, end) - start
            start *= 10
            end *= 10
        }
        
        return steps
    }
}
