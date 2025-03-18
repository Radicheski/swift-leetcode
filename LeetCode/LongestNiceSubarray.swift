//
//  LongestNiceSubarray.swift
//  https://leetcode.com/problems/longest-nice-subarray/
//
//  Created by Erik Radicheski da Silva on 18/03/25.
//

import XCTest

final class LongestNiceSubarray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestNiceSubarray([1, 3, 8, 48, 10]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestNiceSubarray([3, 1, 5, 11, 13]), 1)
    }
    
}

private class Solution {
    func longestNiceSubarray(_ nums: [Int]) -> Int {
        var left = 0
        var bits = 0
        var maximumLength = 0
        
        for (right, num) in nums.enumerated() {
            while bits & num  != 0 {
                bits ^= nums[left]
                left += 1
            }
            
            bits |= num
            maximumLength = max(maximumLength, right - left + 1)
        }
        
        return maximumLength
    }
}
