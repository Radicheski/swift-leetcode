//
//  MaximumSubarray.swift
//  https://leetcode.com/problems/maximum-subarray/
//
//  Created by Erik Radicheski da Silva on 31/08/22.
//

import XCTest

class MaximumSubarray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSubArray([1]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxSubArray([5, 4, -1, 7, 8]), 23)
    }

}

private class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return Int.min
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        let middleIndex = nums.count / 2
        let crossSum = middleCrossigMaxSum(nums, middleIndex)
        
        let left = maxSubArray(Array(nums[0 ..< middleIndex]))
        let right = maxSubArray(Array(nums[middleIndex + 1 ..< nums.count]))
        
        return max(crossSum, left, right)
    }
    
    private func middleCrossigMaxSum(_ nums: [Int], _ middleIndex: Int) -> Int {
        if nums.isEmpty {
            return Int.min
        }
        
        var sum = 0
        
        var leftSum = Int.min
        for offset in 0 ... middleIndex {
            sum += nums[middleIndex - offset]
            leftSum = max(leftSum, sum)
        }
        
        sum = 0
        
        var rightSum = Int.min
        for index in middleIndex ..< nums.count {
            sum += nums[index]
            rightSum = max(rightSum, sum)
        }
        
        return max(leftSum, rightSum, leftSum + rightSum - nums[middleIndex])
        
    }
}
