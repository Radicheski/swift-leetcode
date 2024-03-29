//
//  CountSubarraysWhereMaxElementAppearsAtLeastKTimes.swift
//  https://leetcode.com/problems/count-subarrays-where-max-element-appears-at-least-k-times/
//
//  Created by Erik Radicheski da Silva on 29/03/24.
//

import XCTest

final class CountSubarraysWhereMaxElementAppearsAtLeastKTimes: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countSubarrays([1, 3, 2, 3, 3], 2), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSubarrays([1, 4, 2, 1], 3), 0)
    }
    
}

private class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var maxValue = -1
        
        for num in nums {
            maxValue = max(maxValue, num)
        }
        
        var left = 0
        var answer = 0
        var count = 0
        
        for (right, num) in nums.enumerated() {
            if num == maxValue { count += 1 }
            
            while count == k {
                if nums[left] == maxValue { count -= 1 }
                left += 1
            }
            
            answer += left
        }
        
        return answer
    }
}
