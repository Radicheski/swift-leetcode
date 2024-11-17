//
//  ShortestSubarrayWithSumAtLeastK.swift
//  https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/
//
//  Created by Erik Radicheski da Silva on 17/11/24.
//

import XCTest

final class ShortestSubarrayWithSumAtLeastK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestSubarray([1], 1), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestSubarray([1, 2], 4), -1)
    }
    
    func testExamapleC() {
        XCTAssertEqual(solution.shortestSubarray([2, -1, 2], 3), 3)
    }
    
}

private class Solution {
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        var stack = [(sum: 0, index: -1)]
        var sum = 0
        var minLength = Int.max
        
        for (i, num) in nums.enumerated() {
            sum += num
            
            while let last = stack.last, sum <= last.sum {
                let _ = stack.popLast()
            }
            
            stack.append((sum, i))
            
            let candidate = search(stack, sum - k)
            
            if candidate >= 0 {
                minLength = min(minLength, i - stack[candidate].index)
            }
        }
        
        return minLength == .max ? -1 : minLength
    }
    
    private func search(_ stack: [(sum: Int, index: Int)], _ target: Int) -> Int {
        var left = 0
        var right = stack.endIndex - 1
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if stack[middle].sum <= target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return right
    }
}
