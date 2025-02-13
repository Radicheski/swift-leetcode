//
//  MinimumOperationsToExceedThresholdValue2.swift
//  https://leetcode.com/problems/minimum-operations-to-exceed-threshold-value-ii/
//
//  Created by Erik Radicheski da Silva on 13/02/25.
//

import XCTest

final class MinimumOperationsToExceedThresholdValue2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([2, 11, 10, 1, 3], 10), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([1, 1, 2, 4, 9], 20), 4)
    }
    
}

private class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted(by: >)
        var count = 0
        
        while let last = nums.last, last < k {
            let x = nums.removeLast()
            let y = nums.removeLast()
            
            let z = 2 * min(x, y) + max(x, y)
            
            insert(&nums, z)
            
            count += 1
        }
        
        return count
    }
    
    private func insert(_ nums: inout [Int], _ num: Int) {
        var left = 0
        var right = nums.endIndex - 1
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if nums[middle] > num {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        nums.insert(num, at: left)
    }
}
