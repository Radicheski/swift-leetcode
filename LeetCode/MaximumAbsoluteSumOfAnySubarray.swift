//
//  MaximumAbsoluteSumOfAnySubarray.swift
//  https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray/
//
//  Created by Erik Radicheski da Silva on 26/02/25.
//

import XCTest

final class MaximumAbsoluteSumOfAnySubarray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxAbsoluteSum([1, -3, 2, 3, -4]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxAbsoluteSum([2, -5, 1, -4, 3, -2]), 8)
    }
    
}

private class Solution {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        var prefixSum = 0
        var minSum = Int.max
        var maxSum = Int.min
        var answer = 0
        
        for num in nums {
            prefixSum += num
            
            minSum = min(minSum, prefixSum)
            maxSum = max(maxSum, prefixSum)
            
            answer = max(answer, abs(prefixSum), abs(prefixSum - (prefixSum >= 0 ? minSum : maxSum)))
        }
        
        return answer
    }
}
