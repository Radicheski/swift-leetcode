//
//  CheckIfThereIsAValidPartitionForTheArray.swift
//  https://leetcode.com/problems/check-if-there-is-a-valid-partition-for-the-array/
//
//  Created by Erik Radicheski da Silva on 13/08/23.
//

import XCTest

final class CheckIfThereIsAValidPartitionForTheArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.validPartition([4, 4, 4, 5, 6]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.validPartition([1, 1, 1, 2]))
    }

}

private class Solution {
    func validPartition(_ nums: [Int]) -> Bool {
        var dp = [Int: Bool]()
        dp[-1] = true
        
        return isValid(nums, nums.endIndex - 1, &dp)
    }
    
    private func isValid(_ nums: [Int], _ i: Int, _ dp: inout [Int: Bool]) -> Bool {
        if let answer = dp[i] {
            return answer
        }
        
        var answer = false
        
        if i > 0 && nums[i] == nums[i - 1] {
            answer = answer || isValid(nums, i - 2, &dp)
        }
        
        if i > 1 && nums[i] == nums[i - 1] && nums[i - 1] == nums[i - 2] {
            answer = answer || isValid(nums, i - 3, &dp)
        }
        
        if i > 1 && nums[i] == nums[i - 1] + 1 && nums[i - 1] == nums[i - 2] + 1 {
            answer = answer || isValid(nums, i - 3, &dp)
        }
        
        dp[i] = answer
        return answer
    }
}
