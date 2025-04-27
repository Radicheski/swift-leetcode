//
//  CountSubarraysOfLengthThreeWithACondition.swift
//  https://leetcode.com/problems/count-subarrays-of-length-three-with-a-condition/
//
//  Created by Erik Radicheski da Silva on 27/04/25.
//

import XCTest

final class CountSubarraysOfLengthThreeWithACondition: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countSubarrays([1, 2, 1, 4, 1]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSubarrays([1, 1, 1]), 0)
    }
    
}

private class Solution {
    func countSubarrays(_ nums: [Int]) -> Int {
        var count = 0
        
        for i in 2 ..< nums.endIndex {
            if 2 * (nums[i] + nums[i - 2]) == nums[i - 1] {
                count += 1
            }
        }
        
        return count
    }
}
