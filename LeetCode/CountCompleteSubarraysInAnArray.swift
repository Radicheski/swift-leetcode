//
//  CountCompleteSubarraysInAnArray.swift
//  https://leetcode.com/problems/count-complete-subarrays-in-an-array/
//
//  Created by Erik Radicheski da Silva on 24/04/25.
//

import XCTest

final class CountCompleteSubarraysInAnArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countCompleteSubarrays([1, 3, 1, 2, 2]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countCompleteSubarrays([5, 5, 5, 5]), 10)
    }
    
}

private class Solution {
    func countCompleteSubarrays(_ nums: [Int]) -> Int {
        let target = Set(nums).count
        var count = 0
        var elements = [Int: Int]()
        var left = 0
        var right = 0
        
        while right < nums.endIndex {
            elements[nums[right], default: 0] += 1
            
            while elements.count == target {
                count += nums.count - right
                
                elements[nums[left], default: 0] -= 1
                if elements[nums[left]] == 0 {
                    elements[nums[left]] = nil
                }
                
                left += 1
            }
            
            
            right += 1
        }
        
        return count
    }
}
