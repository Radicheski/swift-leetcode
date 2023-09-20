//
//  MinimumOperationsToReduceXToZero.swift
//  https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/
//
//  Created by Erik Radicheski da Silva on 20/09/23.
//

import XCTest

final class MinimumOperationsToReduceXToZero: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([1, 1, 4, 2, 3], 5), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([5, 6, 7, 8, 9], 4), -1)
    }

    func testExampleC() {
        XCTAssertEqual(solution.minOperations([3, 2, 20, 1, 1, 3], 10), 5)
    }
    
}

private class Solution {
    
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var sum = nums.reduce(into: 0, +=)
        var result = -1
        
        var left = 0
        
        for (right, num) in nums.enumerated() {
            sum -= num
            
            while sum < x && left <= right {
                sum += nums[left]
                left += 1
            }
            
            if sum == x {
                result = max(result, right - left + 1)
            }
        }
        
        return result == -1 ? result : nums.count - result
    }
}
