//
//  FirstMissingPositive.swift
//  https://leetcode.com/problems/first-missing-positive/
//
//  Created by Erik Radicheski da Silva on 26/03/24.
//

import XCTest

final class FirstMissingPositive: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.firstMissingPositive([1, 2, 0]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.firstMissingPositive([3, 4, -1, 1]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.firstMissingPositive([7, 8, 9, 11, 12]), 1)
    }
    
}

private class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        
        var hasOne = false
        
        for (i, num) in nums.enumerated() {
            hasOne = hasOne || num == 1
            
            if num < 1  || num > nums.endIndex {
                nums[i] = 1
            }
        }
        
        guard hasOne else { return 1 }
        
        for i in nums.indices {
            let value = abs(nums[i])
            
            if value == nums.endIndex {
                nums[0] = -abs(nums[0])
            } else {
                nums[value] = -abs(nums[value])
            }
        }
        
        for i in 1 ..< nums.endIndex {
            if nums[i] > 0 { return i }
        }
        
        if nums[0] > 0 { return nums.count }
        
        return nums.count + 1
    }
}
