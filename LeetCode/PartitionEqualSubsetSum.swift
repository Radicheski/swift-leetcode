//
//  PartitionEqualSubsetSum.swift
//  https://leetcode.com/problems/partition-equal-subset-sum/
//
//  Created by Erik Radicheski da Silva on 21/11/22.
//

import XCTest

final class PartitionEqualSubsetSum: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canPartition([1, 5, 11, 5]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canPartition([1, 2, 3, 5]))
    }

}

private class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(into: 0, +=)
        
        if sum.isMultiple(of: 2) == false {
            return false
        }
        
        var dp: [[Bool?]] = Array(repeating: Array(repeating: nil, count: sum / 2 + 1), count: nums.count)
        
        return canPartitionRecursive(&dp, nums, sum / 2, 0)
    }
    
    private func canPartitionRecursive(_ dp: inout [[Bool?]], _ nums: [Int], _ sum: Int, _ index: Int) -> Bool {
        guard index < nums.endIndex else { return false }
        if sum == 0 { return true }
        
        if dp[index][sum] == nil {
            if nums[index] <= sum {
                if canPartitionRecursive(&dp, nums, sum - nums[index], index + 1) {
                    dp[index][sum] = true
                    return true
                }
            }
            dp[index][sum] = canPartitionRecursive(&dp, nums, sum, index + 1)
        }
        
        return dp[index][sum]!
    }
}
