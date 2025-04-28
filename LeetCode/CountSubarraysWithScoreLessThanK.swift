//
//  CountSubarraysWithScoreLessThanK.swift
//  https://leetcode.com/problems/count-subarrays-with-score-less-than-k/
//
//  Created by Erik Radicheski da Silva on 28/04/25.
//

import XCTest

final class CountSubarraysWithScoreLessThanK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countSubarrays([2, 1, 4, 3, 5], 10), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSubarrays([1, 1, 1], 5), 5)
    }
    
}

private class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sum = 0
        var left = 0
        
        for (right, num) in nums.enumerated() {
            sum += num
            
            while left <= right && sum * (right - left + 1) >= k {
                sum -= nums[left]
                left += 1
            }
            
            count += right - left + 1
        }
        
        
        return count
    }
}
