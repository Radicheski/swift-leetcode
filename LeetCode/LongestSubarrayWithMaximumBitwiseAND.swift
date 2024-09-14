//
//  LongestSubarrayWithMaximumBitwiseAND.swift
//  https://leetcode.com/problems/longest-subarray-with-maximum-bitwise-and/
//
//  Created by Erik Radicheski da Silva on 14/09/24.
//

import XCTest

final class LongestSubarrayWithMaximumBitwiseAND: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestSubarray([1, 2, 3, 3, 2, 2]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestSubarray([1, 2, 3, 4]), 1)
    }
    
}

private class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var maximum = Int.min
        
        for num in nums {
            maximum = max(maximum, num)
        }
        
        var maxLength = 0
        var length = 0
        
        for num in nums {
            guard num == maximum else {
                length = 0
                continue
            }
            
            length += 1
            maxLength = max(maxLength, length)
        }
        
        return maxLength
    }
}
