//
//  ZeroArrayTransformationI.swift
//  https://leetcode.com/problems/zero-array-transformation-i/
//
//  Created by Erik Radicheski da Silva on 20/05/25.
//

import XCTest

final class ZeroArrayTransformationI: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isZeroArray([1, 0, 1], [[0, 2]]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isZeroArray([4, 3, 2, 1], [[1, 3], [0, 2]]))
    }
    
}

private class Solution {
    func isZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Bool {
        var delta = Array(repeating: 0, count: nums.count + 1)
        for query in queries {
            let (left, right) = (query[0], query[1])
            delta[left] += 1
            delta[right + 1] -= 1
        }
        
        var operationCounts = Array(repeating: 0, count: delta.count)
        var currentOperations = 0
        for (i, operations) in delta.enumerated() {
            currentOperations += operations
            operationCounts[i] = currentOperations
        }
        
        for i in nums.indices {
            if (operationCounts[i] < nums[i]) {
                return false
            }
        }
        
        return true
    }
}
