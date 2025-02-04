//
//  MaximumAscendingSubarraySum.swift
//  https://leetcode.com/problems/maximum-ascending-subarray-sum/
//
//  Created by Erik Radicheski da Silva on 03/02/25.
//

import XCTest

final class MaximumAscendingSubarraySum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxAscendingSum([10, 20, 30, 5, 10, 50]), 65)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxAscendingSum([10, 20, 30, 40, 50]), 150)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxAscendingSum([12, 17, 15, 13, 10, 11, 12]), 33)
    }
    
}

private class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var answer = nums[0]
        var sum = nums[0]
        
        for i in 1 ..< nums.endIndex {
            if nums[i - 1] < nums[i] {
                sum += nums[i]
                answer = max(answer, sum)
            } else {
                sum = nums[i]
            }
        }
        
        return answer
    }
}
