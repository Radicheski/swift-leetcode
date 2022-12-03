//
//  MaximumSumCircularSubarray.swift
//  https://leetcode.com/problems/maximum-sum-circular-subarray/
//
//  Created by Erik Radicheski da Silva on 03/12/22.
//

import XCTest

final class MaximumSumCircularSubarray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxSubarraySumCircular([1, -2, 3, -2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSubarraySumCircular([5, -3, 5]), 10)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxSubarraySumCircular([-3, -2, -3]), -2)
    }

}

private class Solution {
    
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        let size = nums.count
        
        var rightMax = Array(repeating: 0, count: size)
        rightMax[size - 1] = nums[size - 1]
        
        var suffixSum = nums[size - 1]
        for index in stride(from: size - 2, through: 0, by: -1) {
            suffixSum += nums[index]
            rightMax[index] = max(rightMax[index + 1], suffixSum)
        }
        
        var maxSum = nums[0]
        var specialSum = nums[0]
        
        var prefixSum = 0
        var currentMax = 0
        
        for (index, num) in nums.enumerated() {
            currentMax = max(currentMax, 0) + num
            maxSum = max(maxSum, currentMax)
            prefixSum += num
            if index + 1 < nums.endIndex {
                specialSum = max(specialSum, prefixSum + rightMax[index + 1])
            }
        }
        return max(maxSum, specialSum)
    }
    
}
