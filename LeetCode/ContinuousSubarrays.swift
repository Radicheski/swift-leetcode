//
//  ContinuousSubarrays.swift
//  https://leetcode.com/problems/continuous-subarrays/
//
//  Created by Erik Radicheski da Silva on 13/12/24.
//

import XCTest

final class ContinuousSubarrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.continuousSubarrays([5, 4, 2, 4]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.continuousSubarrays([1, 2, 3]), 6)
    }
    
}

private class Solution {
    func continuousSubarrays(_ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var window = 0
        var count = 0
        
        var currentMinimum = nums[0]
        var currentMaximum = nums[0]
        
        while right < nums.endIndex {
            currentMinimum = min(currentMinimum, nums[right])
            currentMaximum = max(currentMaximum, nums[right])
            
            if currentMaximum - currentMinimum > 2 {
                window = right - left
                count += window * (window + 1) / 2
                
                left = right
                currentMinimum = nums[right]
                currentMaximum = nums[right]
                
                while nums.indices.contains(left) && abs(nums[right] - nums[left - 1]) <= 2 {
                    left -= 1
                    currentMinimum = min(currentMinimum, nums[left])
                    currentMaximum = max(currentMaximum, nums[left])
                }
                
                if left < right {
                    window = right - left
                    count -= window * (window + 1) / 2
                }
            }
            
            right += 1
        }
        
        window = right - left
        count += window * (window + 1) / 2
        
        return count
    }
}
